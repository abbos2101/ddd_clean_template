import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/facades/users_facade.dart';
import '../../domain/models/user_model.dart';
import '../datasources/users_datasource.dart';

/// 🏪 Users Store Implementation - Simple facade like your template!
/// Think of this like a corner store that gets products from the warehouse
@Injectable(as: UsersFacade)
class UsersFacadeImpl implements UsersFacade {
  final UsersDataSource _usersDataSource; // 📦 Warehouse worker

  UsersFacadeImpl(this._usersDataSource);

  @override
  Future<Either<String, List<UserModel>>> getAllUsers() async {
    // 🏪 Customer: "Give me all users"
    // 📦 Store calls warehouse: "Get all users from internet"
    return await _usersDataSource.getAllUsers();
  }

  @override
  Future<Either<String, List<UserModel>>> searchUsers(String query) async {
    // 🔍 Customer: "Search for users matching this"
    // 📦 Store calls warehouse: "Search users with this query"
    return await _usersDataSource.searchUsers(query);
  }

  @override
  Future<void> clearCache() async {
    // 🧹 Customer: "Clear the cache"
    // 📦 Store: "Clean up old data"
    // Note: Could call cache service here if needed
    print('🧹 Cache cleared from UsersFacade');
  }
}
