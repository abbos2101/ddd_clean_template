import 'package:dartz/dartz.dart';

import '../models/user_model.dart';

abstract class UsersRepository {
  /// Get all users with heavy data processing
  Future<Either<String, List<UserModel>>> getAllUsers();

  /// Process large dataset with isolates
  Future<Either<String, List<UserModel>>> processUsersWithIsolate(
    List<Map<String, dynamic>> rawData,
  );

  /// Get users with concurrent filtering
  Future<Either<String, List<UserModel>>> searchUsers(String query);

  /// Heavy computation: Get users sorted by distance from coordinates
  Future<Either<String, List<UserModel>>> getUsersByDistance(
    double lat,
    double lng,
  );

  /// Concurrent batch processing
  Future<Either<String, Map<String, List<UserModel>>>> batchProcessUsers();
}
