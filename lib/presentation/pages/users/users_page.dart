import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/users/users_cubit.dart';
import '../../../di.dart';

@RoutePage()
class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<UsersCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Users Demo - Cubit'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<UsersCubit, UsersCubitState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Box
                  TextField(
                    onChanged: (query) =>
                        context.read<UsersCubit>().searchUsers(query),
                    decoration: const InputDecoration(
                      hintText: 'Search users...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Action Buttons
                  Wrap(
                    spacing: 8,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            context.read<UsersCubit>().getAllUsers(),
                        child: const Text('Load All Users'),
                      ),
                      ElevatedButton(
                        onPressed: () => context
                            .read<UsersCubit>()
                            .sortByDistance(40.7128, -74.0060),
                        child: const Text('Sort by Distance'),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<UsersCubit>().batchProcessUsers(),
                        child: const Text('Batch Process'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Status Display
                  _buildStatusCard('Users Status', state.usersStatus),
                  _buildStatusCard('Search Status', state.searchStatus),
                  _buildStatusCard('Distance Status', state.distanceStatus),
                  _buildStatusCard('Batch Status', state.batchStatus),

                  // Progress Bar
                  if (state.processingProgress > 0)
                    Column(
                      children: [
                        const SizedBox(height: 16),
                        LinearProgressIndicator(
                          value: state.processingProgress / 100,
                        ),
                        Text(
                          'Progress: ${state.processingProgress.toStringAsFixed(1)}%',
                        ),
                      ],
                    ),

                  // Users List
                  if (state.users.isNotEmpty)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            'Users (${state.users.length}):',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.users.length,
                              itemBuilder: (context, index) {
                                final user = state.users[index];
                                return Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text(user.id.toString()),
                                    ),
                                    title: Text(user.name),
                                    subtitle: Text(user.email),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Search Results
                  if (state.searchResults.isNotEmpty)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            'Search Results (${state.searchResults.length}):',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.searchResults.length,
                              itemBuilder: (context, index) {
                                final user = state.searchResults[index];
                                return Card(
                                  color: Colors.yellow[50],
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text(user.id.toString()),
                                    ),
                                    title: Text(user.name),
                                    subtitle: Text(user.email),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatusCard(String title, dynamic status) {
    Color color = Colors.grey;
    String statusText = 'Initial';

    status.when(
      initial: () {
        color = Colors.grey;
        statusText = 'Initial';
      },
      loading: () {
        color = Colors.orange;
        statusText = 'Loading...';
      },
      success: () {
        color = Colors.green;
        statusText = 'Success';
      },
      fail: (error) {
        color = Colors.red;
        statusText = 'Error: $error';
      },
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(Icons.circle, color: color, size: 12),
          const SizedBox(width: 8),
          Text('$title: $statusText'),
        ],
      ),
    );
  }
}
