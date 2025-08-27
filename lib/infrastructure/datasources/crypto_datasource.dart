import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/crypto_model.dart';
import '../services/http/http_service.dart';

/// 🪙 CRYPTO EXCHANGE DATA SOURCE
/// Think of this like a "Financial News Reporter" 📰
///
/// 🏪 Simple Store Metaphor:
/// - This is like a REPORTER who goes to the STOCK EXCHANGE
/// - Gets latest COIN PRICES from the exchange floor
/// - Brings back the news to our app
///
/// 🌍 Real World API: CoinGecko
/// - Free cryptocurrency data
/// - Live prices, market cap, 24h changes
/// - No API key required!

@Injectable()
class CryptoDataSource {
  final HttpService _httpService;

  CryptoDataSource(this._httpService);

  /// 🪙 Get Top Cryptocurrencies (like getting daily newspaper)
  ///
  /// 📰 What this does:
  /// 1. 🌐 Calls CoinGecko API
  /// 2. 📊 Gets top 20 coins by market cap
  /// 3. 💰 Includes prices, changes, market data
  /// 4. 🎨 Returns beautiful data for UI
  Future<Either<String, List<CryptoModel>>> getTopCryptocurrencies() async {
    try {
      print('🪙 CRYPTO REPORTER: Going to exchange to get coin prices...');

      const String endpoint = '/api/v3/coins/markets';

      // 🌍 Real API parameters for beautiful data
      final Map<String, String> queryParams = {
        'vs_currency': 'usd', // 💵 Prices in US Dollars
        'order': 'market_cap_desc', // 📊 Sort by biggest coins first
        'per_page': '20', // 🎯 Top 20 cryptocurrencies
        'page': '1', // 📄 First page
        'sparkline': 'false', // 📈 Skip mini charts for now
        'price_change_percentage': '24h', // 📊 24-hour price changes
      };

      print('🌐 Calling CoinGecko API: $endpoint');
      print('📊 Getting top 20 coins with 24h price changes');

      final response = await _httpService.get(
        endpoint,
        queryParameters: queryParams,
        baseUrl: 'https://api.coingecko.com', // 🌍 Real CoinGecko API
      );

      // 🎉 Success! Convert API data to our beautiful models
      final List<dynamic> cryptoList = response.data as List<dynamic>;
      print('✅ SUCCESS: Got ${cryptoList.length} cryptocurrencies!');

      final List<CryptoModel> cryptocurrencies = cryptoList
          .map((json) => CryptoModel.fromJson(json as Map<String, dynamic>))
          .toList();

      print('🏆 Top 3 Coins:');
      for (
        int i = 0;
        i < (cryptocurrencies.length > 3 ? 3 : cryptocurrencies.length);
        i++
      ) {
        final crypto = cryptocurrencies[i];
        final changeEmoji = (crypto.priceChangePercentage24h ?? 0) >= 0
            ? '📈'
            : '📉';
        print(
          '${i + 1}. ${crypto.name} (${crypto.symbol?.toUpperCase()}) - \$${crypto.currentPrice} $changeEmoji ${crypto.priceChangePercentage24h?.toStringAsFixed(2)}%',
        );
      }

      return right(cryptocurrencies);
    } catch (e) {
      print('❌ CRYPTO ERROR: Failed to get coin prices - $e');
      return left('Failed to fetch cryptocurrency data: $e');
    }
  }

  /// 🔍 Search for specific cryptocurrency
  Future<Either<String, List<CryptoModel>>> searchCryptocurrency(
    String query,
  ) async {
    try {
      print('🔍 CRYPTO SEARCH: Looking for "$query"...');

      const String endpoint = '/api/v3/coins/markets';

      final Map<String, String> queryParams = {
        'vs_currency': 'usd',
        'order': 'market_cap_desc',
        'per_page': '50', // 🔍 Get more results for search
        'page': '1',
        'sparkline': 'false',
        'price_change_percentage': '24h',
      };

      final response = await _httpService.get(
        endpoint,
        queryParameters: queryParams,
        baseUrl: 'https://api.coingecko.com',
      );

      final List<dynamic> cryptoList = response.data as List<dynamic>;

      // 🔍 Filter results based on search query
      final List<CryptoModel> allCryptos = cryptoList
          .map((json) => CryptoModel.fromJson(json as Map<String, dynamic>))
          .toList();

      final List<CryptoModel> filteredCryptos = allCryptos.where((crypto) {
        final name = crypto.name?.toLowerCase() ?? '';
        final symbol = crypto.symbol?.toLowerCase() ?? '';
        final searchQuery = query.toLowerCase();

        return name.contains(searchQuery) || symbol.contains(searchQuery);
      }).toList();

      print(
        '🔍 Found ${filteredCryptos.length} cryptocurrencies matching "$query"',
      );

      return right(filteredCryptos);
    } catch (e) {
      print('❌ SEARCH ERROR: Failed to search cryptocurrencies - $e');
      return left('Failed to search cryptocurrency: $e');
    }
  }

  /// 💎 Get specific cryptocurrency details
  Future<Either<String, CryptoModel>> getCryptocurrencyById(String id) async {
    try {
      print('💎 CRYPTO DETAILS: Getting details for $id...');

      final String endpoint = '/api/v3/coins/$id';

      final Map<String, String> queryParams = {
        'localization': 'false',
        'tickers': 'false',
        'market_data': 'true',
        'community_data': 'false',
        'developer_data': 'false',
        'sparkline': 'false',
      };

      final response = await _httpService.get(
        endpoint,
        queryParameters: queryParams,
        baseUrl: 'https://api.coingecko.com',
      );

      // 🎨 Convert detailed API response to our model
      final Map<String, dynamic> cryptoData =
          response.data as Map<String, dynamic>;
      final CryptoModel crypto = CryptoModel.fromDetailedJson(cryptoData);

      print('💎 SUCCESS: Got detailed data for ${crypto.name}');

      return right(crypto);
    } catch (e) {
      print('❌ DETAILS ERROR: Failed to get cryptocurrency details - $e');
      return left('Failed to fetch cryptocurrency details: $e');
    }
  }
}
