import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/crypto_model.dart';
import '../../domain/facades/crypto_facade.dart';
import '../var_status.dart';

part 'crypto_cubit.freezed.dart';

/// 🪙 CRYPTOCURRENCY STATE
/// Think of this like a "TRADING FLOOR DASHBOARD" 📊💰
/// 
/// 🏪 Simple Dashboard Metaphor:
/// - This is like the BIG SCREENS on a trading floor
/// - Shows: Current prices, loading status, search results, favorites
/// - Updates: Every time new data comes in
/// - Displays: All the information traders need to see
/// 
/// 🎯 What's on our dashboard:
/// 1. 📊 Top cryptocurrencies list
/// 2. 🔍 Search results
/// 3. ⭐ Favorite cryptocurrencies  
/// 4. 🚦 Loading states (traffic lights)
/// 5. 📈 Processing statistics
/// 
/// 🌟 Beautiful UX features:
/// - Loading progress bars
/// - Real-time status updates
/// - Smooth search experience
/// - Persistent favorites

@freezed
abstract class CryptoCubitState with _$CryptoCubitState {
  const factory CryptoCubitState({
    // 🏆 Top Cryptocurrencies Dashboard
    @Default(VarStatus()) VarStatus topCryptosStatus,  // 🚦 Loading status
    @Default([]) List<CryptoModel> topCryptocurrencies, // 💰 Top 20 coins
    
    // 🔍 Search Functionality
    @Default(VarStatus()) VarStatus searchStatus,      // 🚦 Search loading
    @Default([]) List<CryptoModel> searchResults,      // 🔍 Search results
    @Default('') String searchQuery,                   // 📝 Current search
    
    // ⭐ Favorites System
    @Default([]) List<CryptoModel> favoriteCryptocurrencies, // ❤️ User favorites
    @Default(0) int favoritesCount,                    // 📊 Count of favorites
    
    // 📊 UI Enhancement Data
    @Default(0.0) double loadingProgress,              // 📈 Loading progress %
    @Default(0) int processingTimeMs,                  // ⏱️ How fast was API call
    DateTime? lastUpdated,                            // 🕐 When data was updated
    
    // 🎨 Additional UX Features  
    @Default(false) bool isRefreshing,                 // 🔄 Pull-to-refresh status
    String? selectedCryptoId,                         // 💎 Currently selected coin
  }) = _CryptoCubitState;
}
part 'crypto_cubit_state.dart';

@Injectable()
class CryptoCubit extends Cubit<CryptoCubitState> {
  final CryptoFacade _cryptoFacade;
  Timer? _searchTimer;

  CryptoCubit(this._cryptoFacade) : super(const CryptoCubitState());

  /// 🏆 Load top cryptocurrencies (like opening the trading floor)
  Future<void> loadTopCryptocurrencies() async {
    print('🏆 CRYPTO MANAGER: Opening trading floor - loading top cryptos');
    print('🚦 Status: Loading...');

    emit(
      state.copyWith(
        topCryptosStatus: VarStatus.loading(),
        loadingProgress: 0.0,
      ),
    );

    // 🎭 Add some realistic loading progress for better UX
    _simulateLoadingProgress();

    try {
      final stopwatch = Stopwatch()..start();
      final result = await _cryptoFacade.getTopCryptocurrencies();
      stopwatch.stop();

      result.fold(
        (error) {
          print('❌ CRYPTO ERROR: Failed to load - $error');
          emit(
            state.copyWith(
              topCryptosStatus: VarStatus.fail(error),
              processingTimeMs: stopwatch.elapsedMilliseconds,
            ),
          );
        },
        (cryptos) {
          print('✅ CRYPTO SUCCESS: Loaded ${cryptos.length} cryptocurrencies');
          print(
            '🏆 Top 3: ${cryptos.take(3).map((c) => '${c.name} ${c.formattedPrice}').join(', ')}',
          );

          emit(
            state.copyWith(
              topCryptosStatus: VarStatus.success(),
              topCryptocurrencies: cryptos,
              loadingProgress: 100.0,
              processingTimeMs: stopwatch.elapsedMilliseconds,
              lastUpdated: DateTime.now(),
            ),
          );
        },
      );
    } catch (e) {
      print('💥 CRYPTO EXCEPTION: Unexpected error - $e');
      emit(
        state.copyWith(
          topCryptosStatus: VarStatus.fail('Unexpected error occurred'),
        ),
      );
    }
  }

  /// 🔍 Search cryptocurrencies with debouncing (smooth user experience)
  Future<void> searchCryptocurrencies(String query) async {
    print('🔍 CRYPTO SEARCH: User searching for "$query"');

    // Cancel previous search timer for smooth experience
    _searchTimer?.cancel();

    if (query.trim().isEmpty) {
      print('🔍 Empty query - clearing search results');
      emit(
        state.copyWith(
          searchStatus: VarStatus.initial(),
          searchResults: [],
          searchQuery: '',
        ),
      );
      return;
    }

    // 🎯 Debouncing: Wait 500ms before searching (smooth UX)
    print('⏱️ Setting search timer (500ms debounce)...');
    _searchTimer = Timer(const Duration(milliseconds: 500), () async {
      print('✅ Search timer completed! Executing search for: "$query"');

      emit(
        state.copyWith(searchStatus: VarStatus.loading(), searchQuery: query),
      );

      try {
        final stopwatch = Stopwatch()..start();
        final result = await _cryptoFacade.searchCryptocurrency(query);
        stopwatch.stop();

        result.fold(
          (error) {
            print('❌ SEARCH ERROR: $error');
            emit(
              state.copyWith(
                searchStatus: VarStatus.fail(error),
                processingTimeMs: stopwatch.elapsedMilliseconds,
              ),
            );
          },
          (cryptos) {
            print(
              '✅ SEARCH SUCCESS: Found ${cryptos.length} results for "$query"',
            );
            emit(
              state.copyWith(
                searchStatus: VarStatus.success(),
                searchResults: cryptos,
                processingTimeMs: stopwatch.elapsedMilliseconds,
              ),
            );
          },
        );
      } catch (e) {
        print('💥 SEARCH EXCEPTION: $e');
        emit(state.copyWith(searchStatus: VarStatus.fail('Search failed')));
      }
    });
  }

  /// ⭐ Toggle cryptocurrency as favorite (beautiful favorites feature)
  void toggleFavorite(CryptoModel crypto) {
    print('⭐ FAVORITES: Toggling favorite for ${crypto.name}');

    final List<CryptoModel> currentFavorites = List.from(
      state.favoriteCryptocurrencies,
    );
    final bool isAlreadyFavorite = currentFavorites.any(
      (fav) => fav.id == crypto.id,
    );

    if (isAlreadyFavorite) {
      // 💔 Remove from favorites
      currentFavorites.removeWhere((fav) => fav.id == crypto.id);
      print('💔 Removed ${crypto.name} from favorites');
    } else {
      // ❤️ Add to favorites
      currentFavorites.add(crypto);
      print('❤️ Added ${crypto.name} to favorites');
    }

    emit(
      state.copyWith(
        favoriteCryptocurrencies: currentFavorites,
        favoritesCount: currentFavorites.length,
      ),
    );

    print('⭐ Total favorites: ${currentFavorites.length}');
  }

  /// 🔄 Refresh data (pull-to-refresh functionality)
  Future<void> refreshData() async {
    print('🔄 REFRESH: User pulled to refresh crypto data');

    // 🧹 Clear cache first for fresh data
    await _cryptoFacade.clearCache();

    // 🔄 Reload top cryptocurrencies
    await loadTopCryptocurrencies();

    print('✅ REFRESH COMPLETE: Fresh crypto data loaded');
  }

  /// 🧹 Clear search results
  void clearSearch() {
    print('🧹 CLEAR SEARCH: Clearing search results');
    _searchTimer?.cancel();

    emit(
      state.copyWith(
        searchStatus: VarStatus.initial(),
        searchResults: [],
        searchQuery: '',
      ),
    );
  }

  /// 📊 Simulate loading progress for better UX
  void _simulateLoadingProgress() {
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (state.topCryptosStatus.isLoading) {
        final newProgress = (state.loadingProgress + 15.0).clamp(0.0, 90.0);
        emit(state.copyWith(loadingProgress: newProgress));
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    _searchTimer?.cancel();
    return super.close();
  }
}
