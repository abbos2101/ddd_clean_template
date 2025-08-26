import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/post_model.dart';
import '../../domain/repositories/posts_repository.dart';
import '../datasources/posts_datasource.dart';

@Injectable(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  final PostsDataSource _dataSource;

  PostsRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, List<PostModel>>> getAllPosts() async {
    return await _dataSource.getAllPosts();
  }

  @override
  Future<Either<String, PostModel>> getPostById(int id) async {
    return await _dataSource.getPostById(id);
  }

  @override
  Future<Either<String, List<PostModel>>> getPostsByUserId(int userId) async {
    return await _dataSource.getPostsByUserId(userId);
  }
}
