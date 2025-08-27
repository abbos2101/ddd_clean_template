import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/user_model.dart';
import '../services/http/http_service.dart';
import '../services/heavy_data_processor.dart';

@Injectable()
class UsersDataSource {
  final HttpService _httpService;

  UsersDataSource(this._httpService);

  /// Fetch users with heavy data processing
  Future<Either<String, List<UserModel>>> getAllUsers() async {
    try {
      final dio = _httpService.client(
        requiredToken: false,
        baseUrl: 'https://jsonplaceholder.typicode.com',
        cacheDuration: const Duration(minutes: 5),
      );

      // Add proper headers
      dio.options.headers.addAll({
        'User-Agent': 'Flutter App / DDD Clean Template',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });

      final response = await dio.get('/users');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        // Convert to map list for heavy processing
        final rawData = data.cast<Map<String, dynamic>>();

        // Process with isolate for heavy operations
        final users = await HeavyDataProcessor.processUsersInIsolate(rawData);

        return right(users);
      } else {
        return left('Failed to load users: ${response.statusCode}');
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

  /// Simulate heavy data fetching (multiple endpoints concurrently)
  Future<Either<String, Map<String, List<UserModel>>>>
  batchProcessUsers() async {
    try {
      final dio = _httpService.client(
        requiredToken: false,
        baseUrl: 'https://jsonplaceholder.typicode.com',
        cacheDuration: Duration.zero,
      );

      dio.options.headers.addAll({
        'User-Agent': 'Flutter App / DDD Clean Template',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });

      // Fetch multiple endpoints concurrently
      final futures = [
        dio.get('/users'),
        dio.get('/users?_limit=5'),
        dio.get('/users?_start=5&_limit=5'),
      ];

      final responses = await Future.wait(futures);

      // Process each response concurrently
      final processingFutures = responses.map((response) async {
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data;
          final rawData = data.cast<Map<String, dynamic>>();
          return await HeavyDataProcessor.processUsersInIsolate(rawData);
        }
        return <UserModel>[];
      });

      final results = await Future.wait(processingFutures);

      return right({
        'all_users': results[0],
        'first_batch': results[1],
        'second_batch': results[2],
      });
    } on DioException catch (e) {
      return left('Batch processing failed: ${e.message}');
    } catch (e) {
      return left('Unexpected error in batch processing: ${e.toString()}');
    }
  }

  /// Search users with concurrent processing
  Future<Either<String, List<UserModel>>> searchUsers(String query) async {
    try {
      // First get all users
      final usersResult = await getAllUsers();

      return usersResult.fold((error) => left(error), (users) async {
        // Use concurrent search
        final searchResults = await HeavyDataProcessor.concurrentSearch(
          users,
          query,
        );
        return right(searchResults);
      });
    } catch (e) {
      return left('Search failed: ${e.toString()}');
    }
  }

  /// Get users sorted by distance (heavy computation)
  Future<Either<String, List<UserModel>>> getUsersByDistance(
    double targetLat,
    double targetLng,
  ) async {
    try {
      final usersResult = await getAllUsers();

      return usersResult.fold((error) => left(error), (users) async {
        // Heavy computation in background
        final sortedUsers = await _sortUsersByDistance(
          users,
          targetLat,
          targetLng,
        );
        return right(sortedUsers);
      });
    } catch (e) {
      return left('Distance calculation failed: ${e.toString()}');
    }
  }

  Future<List<UserModel>> _sortUsersByDistance(
    List<UserModel> users,
    double targetLat,
    double targetLng,
  ) async {
    // Use compute for heavy sorting operation
    return await Future(() {
      final usersWithDistance = users.map((user) {
        final lat = double.tryParse(user.address.geo.lat) ?? 0.0;
        final lng = double.tryParse(user.address.geo.lng) ?? 0.0;

        final distance = HeavyDataProcessor.calculateDistance(
          targetLat,
          targetLng,
          lat,
          lng,
        );

        return {'user': user, 'distance': distance};
      }).toList();

      // Sort by distance
      usersWithDistance.sort(
        (a, b) => (a['distance'] as double).compareTo(b['distance'] as double),
      );

      return usersWithDistance
          .map((item) => item['user'] as UserModel)
          .toList();
    });
  }
}
