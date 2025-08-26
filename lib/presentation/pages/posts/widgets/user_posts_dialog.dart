import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/posts/posts_cubit.dart';
import 'post_item_widget.dart';

class UserPostsDialog extends StatelessWidget {
  const UserPostsDialog({super.key});

  static Future<void> show(BuildContext context) {
    final postsCubit = context.read<PostsCubit>();
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: postsCubit,
          child: const UserPostsDialog(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Load User Posts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'User ID',
                    hintText: 'Enter user ID (1-10)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onSubmitted: (value) {
                    final userId = int.tryParse(value);
                    if (userId != null) {
                      context.read<PostsCubit>().getPostsByUserId(userId);
                    }
                  },
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  // You can add a text controller here if needed
                  // For now, let's load user 1's posts as example
                  context.read<PostsCubit>().getPostsByUserId(1);
                },
                child: const Text('Load'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<PostsCubit, PostsState>(
              builder: (context, state) {
                return state.userPostsStatus.when(
                  initial: () => const Center(
                    child: Text(
                      'Enter a user ID to load their posts',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  loading: () => const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Loading user posts...'),
                      ],
                    ),
                  ),
                  fail: (error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error: $error',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  success: () => state.userPosts.isEmpty
                      ? const Center(
                          child: Text(
                            'No posts found for this user',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: state.userPosts.length,
                          itemBuilder: (context, index) {
                            return PostItemWidget(post: state.userPosts[index]);
                          },
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
