import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_model.freezed.dart';
part 'crypto_model.g.dart';

/// 🪙 CRYPTOCURRENCY MODEL
/// Think of this like a "COIN INFORMATION CARD" 💳
///
/// 🏪 Simple Store Metaphor:
/// - This is like a PRODUCT LABEL on each coin
/// - Shows PRICE, NAME, PICTURE, and if it's going UP 📈 or DOWN 📉
/// - Like a trading card for each cryptocurrency!
///
/// 💎 What each field means:
/// - id: Unique coin identifier (like barcode)
/// - name: Full name (Bitcoin)
/// - symbol: Short code (BTC)
/// - currentPrice: Current price in dollars 💰
/// - priceChangePercentage24h: How much it went up/down today
/// - marketCap: Total value of all coins
/// - image: Pretty coin logo 🖼️

@freezed
abstract class CryptoModel with _$CryptoModel {
  const factory CryptoModel({
    // 🆔 Basic Information
    String? id, // 'bitcoin', 'ethereum'
    String? symbol, // 'BTC', 'ETH'
    String? name, // 'Bitcoin', 'Ethereum'
    String? image, // 🖼️ Coin logo URL
    // 💰 Price Information
    @JsonKey(name: 'current_price')
    double? currentPrice, // Current price in USD

    @JsonKey(name: 'market_cap') double? marketCap, // Total market value

    @JsonKey(name: 'market_cap_rank')
    int? marketCapRank, // Ranking (1=Bitcoin, 2=Ethereum...)
    // 📊 Price Changes (for beautiful green/red indicators)
    @JsonKey(name: 'price_change_24h')
    double? priceChange24h, // Price change in dollars

    @JsonKey(name: 'price_change_percentage_24h')
    double? priceChangePercentage24h, // Price change in percentage
    // 📈 Trading Information
    @JsonKey(name: 'total_volume') double? totalVolume, // 24h trading volume

    @JsonKey(name: 'high_24h') double? high24h, // Highest price today

    @JsonKey(name: 'low_24h') double? low24h, // Lowest price today
    // 💎 Additional Data
    @JsonKey(name: 'circulating_supply')
    double? circulatingSupply, // How many coins exist

    @JsonKey(name: 'total_supply')
    double? totalSupply, // Maximum possible coins

    @JsonKey(name: 'max_supply') double? maxSupply, // Hard limit of coins

    @JsonKey(name: 'last_updated')
    String? lastUpdated, // When data was last updated
  }) = _CryptoModel;

  factory CryptoModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoModelFromJson(json);

  /// 🎨 Create from detailed API response (for single coin details)
  factory CryptoModel.fromDetailedJson(Map<String, dynamic> json) {
    final marketData = json['market_data'] as Map<String, dynamic>?;

    return CryptoModel(
      id: json['id'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      image: (json['image'] as Map<String, dynamic>?)?['large'] as String?,

      // 💰 Extract price data from market_data object
      currentPrice:
          (marketData?['current_price'] as Map<String, dynamic>?)?['usd']
              ?.toDouble(),
      marketCap: (marketData?['market_cap'] as Map<String, dynamic>?)?['usd']
          ?.toDouble(),
      marketCapRank: marketData?['market_cap_rank'] as int?,

      priceChange24h:
          (marketData?['price_change_24h'] as Map<String, dynamic>?)?['usd']
              ?.toDouble(),
      priceChangePercentage24h: marketData?['price_change_percentage_24h']
          ?.toDouble(),

      totalVolume:
          (marketData?['total_volume'] as Map<String, dynamic>?)?['usd']
              ?.toDouble(),
      high24h: (marketData?['high_24h'] as Map<String, dynamic>?)?['usd']
          ?.toDouble(),
      low24h: (marketData?['low_24h'] as Map<String, dynamic>?)?['usd']
          ?.toDouble(),

      circulatingSupply: marketData?['circulating_supply']?.toDouble(),
      totalSupply: marketData?['total_supply']?.toDouble(),
      maxSupply: marketData?['max_supply']?.toDouble(),

      lastUpdated: json['last_updated'] as String?,
    );
  }
}

/// 🎨 Extension for beautiful UI helpers
extension CryptoModelExtensions on CryptoModel {
  /// 📊 Is the price going up? (for green color 💚)
  bool get isPriceUp => (priceChangePercentage24h ?? 0) >= 0;

  /// 🎨 Get the right emoji for price movement
  String get priceEmoji => isPriceUp ? '📈' : '📉';

  /// 💰 Formatted current price
  String get formattedPrice {
    if (currentPrice == null) return '\$0.00';
    if (currentPrice! >= 1) {
      return '\$${currentPrice!.toStringAsFixed(2)}';
    } else {
      return '\$${currentPrice!.toStringAsFixed(6)}';
    }
  }

  /// 📊 Formatted price change percentage
  String get formattedPriceChange {
    if (priceChangePercentage24h == null) return '0.00%';
    final sign = isPriceUp ? '+' : '';
    return '$sign${priceChangePercentage24h!.toStringAsFixed(2)}%';
  }

  /// 💎 Formatted market cap
  String get formattedMarketCap {
    if (marketCap == null) return '\$0';
    if (marketCap! >= 1e12) {
      return '\$${(marketCap! / 1e12).toStringAsFixed(2)}T';
    } else if (marketCap! >= 1e9) {
      return '\$${(marketCap! / 1e9).toStringAsFixed(2)}B';
    } else if (marketCap! >= 1e6) {
      return '\$${(marketCap! / 1e6).toStringAsFixed(2)}M';
    } else {
      return '\$${marketCap!.toStringAsFixed(0)}';
    }
  }

  /// 📈 Formatted 24h volume
  String get formattedVolume {
    if (totalVolume == null) return '\$0';
    if (totalVolume! >= 1e9) {
      return '\$${(totalVolume! / 1e9).toStringAsFixed(2)}B';
    } else if (totalVolume! >= 1e6) {
      return '\$${(totalVolume! / 1e6).toStringAsFixed(2)}M';
    } else if (totalVolume! >= 1e3) {
      return '\$${(totalVolume! / 1e3).toStringAsFixed(2)}K';
    } else {
      return '\$${totalVolume!.toStringAsFixed(0)}';
    }
  }

  /// 🏆 Get rank display
  String get rankDisplay {
    if (marketCapRank == null) return '#--';
    return '#${marketCapRank!}';
  }

  /// 🎨 Get color for price change (for beautiful UI)
  /// Use this with Flutter Colors:
  /// Color.fromRGBO(isPriceUp ? 76 : 244, isPriceUp ? 175 : 67, isPriceUp ? 80 : 54, 1)
  bool get shouldShowGreenColor => isPriceUp;
}
