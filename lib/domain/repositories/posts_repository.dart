import 'package:dartz/dartz.dart';
import '../models/post_model.dart';

abstract class PostsRepository {
  Future<Either<String, List<PostModel>>> getAllPosts();
  Future<Either<String, PostModel>> getPostById(int id);
  Future<Either<String, List<PostModel>>> getPostsByUserId(int userId);
}
