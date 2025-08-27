import 'package:dartz/dartz.dart';
import '../models/user_model.dart';

/// 🏪 Simple User Facade - like a corner store
/// Just ask for users, we give you users!
abstract class UsersFacade {
  /// Get all users - simple request
  Future<Either<String, List<UserModel>>> getAllUsers();

  /// Search users - simple request
  Future<Either<String, List<UserModel>>> searchUsers(String query);

  /// Clear cache - simple action
  Future<void> clearCache();
}
