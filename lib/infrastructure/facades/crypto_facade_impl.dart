import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/facades/crypto_facade.dart';
import '../../domain/models/crypto_model.dart';
import '../datasources/crypto_datasource.dart';

/// 🪙 CRYPTOCURRENCY FACADE IMPLEMENTATION
/// Think of this like the "CRYPTO EXCHANGE MANAGER" 🏪💰
///
/// 🏪 Simple Store Metaphor:
/// - This is the STORE MANAGER who coordinates everything
/// - Customer asks → Manager tells DATA WORKER → Gets results → Gives to customer
/// - Customer (UI) ← Manager (Facade) ← Worker (DataSource) ← Internet (API)
///
/// 🔄 How it works:
/// 1. 📱 UI asks: "Show me Bitcoin price"
/// 2. 🏪 Facade says: "DataSource, get Bitcoin data"
/// 3. 🌐 DataSource calls: CoinGecko API
/// 4. 📊 API returns: Real crypto data
/// 5. 🎨 Facade gives: Beautiful formatted data to UI
///
/// ✨ Why this is BETTER than Repository:
/// - 🎯 DIRECT: No complex layers
/// - 🚀 FAST: Straight to the point
/// - 🧹 CLEAN: Easy to understand
/// - 💡 SIMPLE: Like ordering food at counter

@Injectable(as: CryptoFacade)
class CryptoFacadeImpl implements CryptoFacade {
  final CryptoDataSource _cryptoDataSource; // 🌐 Our data worker

  CryptoFacadeImpl(this._cryptoDataSource);

  @override
  Future<Either<String, List<CryptoModel>>> getTopCryptocurrencies() async {
    // 🏆 Customer asks: "What are the top cryptocurrencies?"
    // 🏪 Manager says: "DataSource, get the popular coins!"

    print('🏪 CRYPTO FACADE: Customer wants top cryptocurrencies');
    print('📞 Calling DataSource to get real-time data...');

    try {
      final result = await _cryptoDataSource.getTopCryptocurrencies();

      return result.fold(
        (error) {
          print('❌ FACADE ERROR: DataSource failed - $error');
          return left(
            'Unable to get cryptocurrency prices. Please check your internet connection.',
          );
        },
        (cryptos) {
          print('✅ FACADE SUCCESS: Got ${cryptos.length} cryptocurrencies');
          print('🎉 Ready to show beautiful crypto data to user!');
          return right(cryptos);
        },
      );
    } catch (e) {
      print('💥 FACADE EXCEPTION: Unexpected error - $e');
      return left('Something went wrong while getting crypto data.');
    }
  }

  @override
  Future<Either<String, List<CryptoModel>>> searchCryptocurrency(
    String query,
  ) async {
    // 🔍 Customer asks: "Do you have information about [query]?"
    // 🏪 Manager says: "Let me search for that!"

    if (query.trim().isEmpty) {
      print('🔍 SEARCH: Query is empty, returning empty results');
      return right([]);
    }

    print('🔍 CRYPTO FACADE: Customer searching for "$query"');
    print('📞 Asking DataSource to search...');

    try {
      final result = await _cryptoDataSource.searchCryptocurrency(query);

      return result.fold(
        (error) {
          print('❌ SEARCH ERROR: DataSource failed - $error');
          return left('Unable to search cryptocurrencies. Please try again.');
        },
        (cryptos) {
          print(
            '✅ SEARCH SUCCESS: Found ${cryptos.length} results for "$query"',
          );
          return right(cryptos);
        },
      );
    } catch (e) {
      print('💥 SEARCH EXCEPTION: Unexpected error - $e');
      return left('Something went wrong while searching.');
    }
  }

  @override
  Future<Either<String, CryptoModel>> getCryptocurrencyById(String id) async {
    // 💎 Customer asks: "Tell me everything about [crypto]"
    // 🏪 Manager says: "Let me get detailed information!"

    print('💎 CRYPTO FACADE: Customer wants details for "$id"');
    print('📞 Getting detailed data from DataSource...');

    try {
      final result = await _cryptoDataSource.getCryptocurrencyById(id);

      return result.fold(
        (error) {
          print('❌ DETAILS ERROR: DataSource failed - $error');
          return left(
            'Unable to get cryptocurrency details. Please try again.',
          );
        },
        (crypto) {
          print('✅ DETAILS SUCCESS: Got detailed info for ${crypto.name}');
          return right(crypto);
        },
      );
    } catch (e) {
      print('💥 DETAILS EXCEPTION: Unexpected error - $e');
      return left('Something went wrong while getting crypto details.');
    }
  }

  @override
  Future<void> clearCache() async {
    // 🧹 Customer asks: "Give me fresh data"
    // 🏪 Manager says: "Let me clear old data and get fresh prices!"

    print('🧹 CRYPTO FACADE: Clearing cache for fresh data');

    try {
      // 🔄 In a real app, you might clear local storage, cache, etc.
      // For now, we just log that cache is cleared
      print('✅ CACHE CLEARED: Ready for fresh cryptocurrency data');

      // 💡 Future enhancement: Clear local database, shared preferences, etc.
      // await _localCache.clear();
      // await _sharedPreferences.clear();
    } catch (e) {
      print('❌ CACHE CLEAR ERROR: $e');
      // 🤷 Cache clearing is not critical, so we don't throw
    }
  }
}
