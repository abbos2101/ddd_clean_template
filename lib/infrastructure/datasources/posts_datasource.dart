import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/post_model.dart';
import '../services/http/http_service.dart';

@Injectable()
class PostsDataSource {
  final HttpService _httpService;

  PostsDataSource(this._httpService);

  Future<Either<String, List<PostModel>>> getAllPosts() async {
    try {
      final dio = _httpService.client(
        requiredToken: false,
        baseUrl: 'https://jsonplaceholder.typicode.com',
        cacheDuration: Duration.zero, // Disable cache temporarily
      );

      // Add proper headers to avoid 403 errors
      dio.options.headers.addAll({
        'User-Agent': 'Flutter App / DDD Clean Template',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });

      final response = await dio.get('/posts');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final posts = data.map((json) => PostModel.fromJson(json)).toList();
        return right(posts);
      } else {
        return left('Failed to load posts: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(
          'Connection timeout. Please check your internet connection.',
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left('Request timeout. Please try again.');
      } else if (e.response != null) {
        return left('Server error: ${e.response?.statusCode}');
      } else {
        return left('Network error. Please check your internet connection.');
      }
    } catch (e) {
      return left('Unexpected error: ${e.toString()}');
    }
  }

  Future<Either<String, PostModel>> getPostById(int id) async {
    try {
      final dio = _httpService.client(
        requiredToken: false,
        baseUrl: 'https://jsonplaceholder.typicode.com',
        cacheDuration: const Duration(minutes: 10),
      );

      // Add proper headers to avoid 403 errors
      dio.options.headers.addAll({
        'User-Agent': 'Flutter App / DDD Clean Template',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });

      final response = await dio.get('/posts/$id');

      if (response.statusCode == 200) {
        final post = PostModel.fromJson(response.data);
        return right(post);
      } else {
        return left('Failed to load post: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(
          'Connection timeout. Please check your internet connection.',
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left('Request timeout. Please try again.');
      } else if (e.response != null) {
        return left('Server error: ${e.response?.statusCode}');
      } else {
        return left('Network error. Please check your internet connection.');
      }
    } catch (e) {
      return left('Unexpected error: ${e.toString()}');
    }
  }

  Future<Either<String, List<PostModel>>> getPostsByUserId(int userId) async {
    try {
      final dio = _httpService.client(
        requiredToken: false,
        baseUrl: 'https://jsonplaceholder.typicode.com',
        cacheDuration: const Duration(minutes: 5),
      );

      // Add proper headers to avoid 403 errors
      dio.options.headers.addAll({
        'User-Agent': 'Flutter App / DDD Clean Template',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });

      final response = await dio.get(
        '/posts',
        queryParameters: {'userId': userId},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final posts = data.map((json) => PostModel.fromJson(json)).toList();
        return right(posts);
      } else {
        return left('Failed to load user posts: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(
          'Connection timeout. Please check your internet connection.',
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left('Request timeout. Please try again.');
      } else if (e.response != null) {
        return left('Server error: ${e.response?.statusCode}');
      } else {
        return left('Network error. Please check your internet connection.');
      }
    } catch (e) {
      return left('Unexpected error: ${e.toString()}');
    }
  }
}
