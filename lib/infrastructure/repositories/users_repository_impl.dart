import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/user_model.dart';
import '../../domain/repositories/users_repository.dart';
import '../datasources/users_datasource.dart';

@Injectable(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  final UsersDataSource _dataSource;

  UsersRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, List<UserModel>>> getAllUsers() async {
    return await _dataSource.getAllUsers();
  }

  @override
  Future<Either<String, List<UserModel>>> processUsersWithIsolate(
    List<Map<String, dynamic>> rawData,
  ) async {
    try {
      // This would typically involve complex processing
      final users = rawData.map((json) => UserModel.fromJson(json)).toList();
      return right(users);
    } catch (e) {
      return left('Failed to process users: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, List<UserModel>>> searchUsers(String query) async {
    return await _dataSource.searchUsers(query);
  }

  @override
  Future<Either<String, List<UserModel>>> getUsersByDistance(
    double lat,
    double lng,
  ) async {
    return await _dataSource.getUsersByDistance(lat, lng);
  }

  @override
  Future<Either<String, Map<String, List<UserModel>>>>
  batchProcessUsers() async {
    return await _dataSource.batchProcessUsers();
  }
}
