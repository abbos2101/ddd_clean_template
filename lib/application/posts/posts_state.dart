part of 'posts_cubit.dart';

@freezed
abstract class PostsState with _$PostsState {
  const factory PostsState.initial({
    /// getAllPosts
    @Default(VarStatus()) VarStatus allPostsStatus,
    @Default([]) List<PostModel> posts,

    /// getPostById
    @Default(VarStatus()) VarStatus selectedPostStatus,
    PostModel? selectedPost,

    /// getPostsByUserId
    @Default(VarStatus()) VarStatus userPostsStatus,
    @Default([]) List<PostModel> userPosts,
  }) = _Initial;
}
