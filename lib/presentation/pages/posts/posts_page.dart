import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/posts/posts_cubit.dart';
import '../../../di.dart';
import 'widgets/posts_list_widget.dart';
import 'widgets/posts_error_widget.dart';
import 'widgets/posts_loading_widget.dart';
import 'widgets/posts_initial_widget.dart';
import 'widgets/user_posts_dialog.dart';

@RoutePage()
class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<PostsCubit>()..getAllPosts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts Demo'),
          actions: [
            BlocBuilder<PostsCubit, PostsState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () => context.read<PostsCubit>().refreshPosts(),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            return state.allPostsStatus.when(
              initial: () => const PostsInitialWidget(),
              loading: () => const PostsLoadingWidget(),
              fail: (error) => PostsErrorWidget(error: error),
              success: () => PostsListWidget(posts: state.posts),
            );
          },
        ),
        floatingActionButton: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () => UserPostsDialog.show(context),
              child: const Icon(Icons.person),
              tooltip: 'Load User Posts',
            );
          },
        ),
      ),
    );
  }
}
