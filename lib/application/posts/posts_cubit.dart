import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/post_model.dart';
import '../../domain/repositories/posts_repository.dart';
import '../var_status.dart';

part 'posts_cubit.freezed.dart';
part 'posts_state.dart';

@Injectable()
class PostsCubit extends Cubit<PostsState> {
  final PostsRepository _postsRepository;

  PostsCubit(this._postsRepository) : super(const PostsState.initial());

  Future<void> getAllPosts() async {
    emit(state.copyWith(allPostsStatus: VarStatus.loading()));

    final result = await _postsRepository.getAllPosts();

    result.fold(
      (error) => emit(state.copyWith(allPostsStatus: VarStatus.fail(error))),
      (posts) => emit(
        state.copyWith(allPostsStatus: VarStatus.success(), posts: posts),
      ),
    );
  }

  Future<void> getPostById(int id) async {
    emit(state.copyWith(selectedPostStatus: VarStatus.loading()));

    final result = await _postsRepository.getPostById(id);

    result.fold(
      (error) =>
          emit(state.copyWith(selectedPostStatus: VarStatus.fail(error))),
      (post) => emit(
        state.copyWith(
          selectedPostStatus: VarStatus.success(),
          selectedPost: post,
        ),
      ),
    );
  }

  Future<void> getPostsByUserId(int userId) async {
    emit(state.copyWith(userPostsStatus: VarStatus.loading()));

    final result = await _postsRepository.getPostsByUserId(userId);

    result.fold(
      (error) => emit(state.copyWith(userPostsStatus: VarStatus.fail(error))),
      (posts) => emit(
        state.copyWith(userPostsStatus: VarStatus.success(), userPosts: posts),
      ),
    );
  }

  void clearSelectedPost() {
    emit(
      state.copyWith(
        selectedPost: null,
        selectedPostStatus: VarStatus.initial(),
      ),
    );
  }

  void clearUserPosts() {
    emit(state.copyWith(userPosts: [], userPostsStatus: VarStatus.initial()));
  }

  Future<void> refreshPosts() async {
    await getAllPosts();
  }
}
