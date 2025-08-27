import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/user_model.dart';
import '../../domain/facades/users_facade.dart'; // 🏪 Simple Facade like template!
import '../var_status.dart';

part 'users_cubit.freezed.dart';
part 'users_cubit_state.dart';

@Injectable()
class UsersCubit extends Cubit<UsersCubitState> {
  final UsersFacade _usersFacade; // 🏪 Using Facade like your template!
  Timer? _searchTimer;

  UsersCubit(this._usersFacade) : super(const UsersCubitState());

  /// Load all users - Simple method call
  Future<void> getAllUsers() async {
    print('📚 BOOK CONCEPT: Starting state management pattern');
    print('🔄 Step 1: Emit loading state');

    emit(
      state.copyWith(usersStatus: VarStatus.loading(), processingProgress: 0.0),
    );

    print('🔄 Step 2: Call repository (Domain Layer)');
    final stopwatch = Stopwatch()..start();
    final result = await _usersFacade.getAllUsers(); // 🏪 Simple store request!
    stopwatch.stop();

    print('🔄 Step 3: Handle result with Either pattern');
    result.fold(
      (error) {
        print('❌ Error occurred: $error');
        emit(
          state.copyWith(
            usersStatus: VarStatus.fail(error),
            processingTimeMs: stopwatch.elapsedMilliseconds,
          ),
        );
      },
      (users) {
        print('✅ Success: Got ${users.length} users');
        emit(
          state.copyWith(
            usersStatus: VarStatus.success(),
            users: users,
            processingProgress: 100.0,
            processingTimeMs: stopwatch.elapsedMilliseconds,
          ),
        );
      },
    );

    print('📚 BOOK CONCEPT: State management pattern completed!');
  }

  /// Search users with simple debouncing
  Future<void> searchUsers(String query) async {
    print('📚 BOOK CONCEPT: Debouncing user input');

    // Cancel previous search timer
    _searchTimer?.cancel();
    print('⏹️ Cancelled previous search timer');

    if (query.trim().isEmpty) {
      print('🔄 Query is empty, clearing results');
      emit(
        state.copyWith(
          searchStatus: VarStatus(),
          searchResults: [],
          searchQuery: '',
        ),
      );
      return;
    }

    // 📚 BOOK EXERCISE: Try changing this duration!
    // Simple debouncing - wait 300ms before searching
    print('⏱️ Setting 300ms timer for debouncing...');
    _searchTimer = Timer(const Duration(milliseconds: 300), () async {
      print('✅ Timer completed! Starting search for: "$query"');

      emit(
        state.copyWith(
          searchStatus: VarStatus.loading(),
          searchQuery: query,
          processingProgress: 0.0,
        ),
      );

      final stopwatch = Stopwatch()..start();
      final result = await _usersFacade.searchUsers(query); // 🏪 Simple search!
      stopwatch.stop();

      result.fold(
        (error) {
          print('❌ Search failed: $error');
          emit(
            state.copyWith(
              searchStatus: VarStatus.fail(error),
              processingTimeMs: stopwatch.elapsedMilliseconds,
            ),
          );
        },
        (users) {
          print('✅ Found ${users.length} users matching "$query"');
          emit(
            state.copyWith(
              searchStatus: VarStatus.success(),
              searchResults: users,
              processingProgress: 100.0,
              processingTimeMs: stopwatch.elapsedMilliseconds,
            ),
          );
        },
      );

      print('📚 BOOK CONCEPT: Debouncing completed!');
    });
  }

  /// Refresh users - Simple method like template
  Future<void> refreshUsers() async {
    await getAllUsers();
  }

  /// Clear cache - Simple action like template
  Future<void> clearCache() async {
    await _usersFacade.clearCache();
    emit(const UsersCubitState());
  }

  @override
  Future<void> close() {
    _searchTimer?.cancel();
    return super.close();
  }
}
