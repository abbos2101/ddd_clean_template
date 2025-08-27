import 'package:dartz/dartz.dart';

import '../models/crypto_model.dart';

/// 🪙 CRYPTOCURRENCY FACADE INTERFACE
/// Think of this like a "CRYPTO EXCHANGE COUNTER" 🏪
///
/// 🏪 Simple Store Metaphor:
/// - This is like the FRONT COUNTER of a crypto exchange
/// - You ask for what you want (coins, prices, search)
/// - The counter person (facade) gets it for you
/// - You don't need to know HOW they get the data
///
/// 🎯 Why Facade instead of Repository?
/// - SIMPLER: Just ask and receive
/// - CLEANER: Less complex patterns
/// - FASTER: Direct communication
/// - EASIER: Like ordering at a restaurant counter
///
/// 💰 What you can ask for:
/// 1. "Give me top cryptocurrencies" → getTopCryptocurrencies()
/// 2. "Search for Bitcoin" → searchCryptocurrency()
/// 3. "Get Bitcoin details" → getCryptocurrencyById()
/// 4. "Clear old data" → clearCache()

abstract class CryptoFacade {
  /// 🏆 Get top cryptocurrencies (like asking "What are the popular coins?")
  ///
  /// 📊 Returns: Top 20 coins by market cap
  /// 💰 Includes: Prices, 24h changes, market data
  /// 🎨 Perfect for: Main dashboard display
  Future<Either<String, List<CryptoModel>>> getTopCryptocurrencies();

  /// 🔍 Search for cryptocurrencies (like asking "Do you have Dogecoin?")
  ///
  /// 📝 Input: Search query (name or symbol)
  /// 🎯 Returns: List of matching cryptocurrencies
  /// 🔍 Perfect for: Search functionality
  Future<Either<String, List<CryptoModel>>> searchCryptocurrency(String query);

  /// 💎 Get detailed cryptocurrency info (like asking "Tell me everything about Bitcoin")
  ///
  /// 🆔 Input: Crypto ID (like 'bitcoin', 'ethereum')
  /// 📊 Returns: Detailed information with market data
  /// 🎨 Perfect for: Detail pages, charts
  Future<Either<String, CryptoModel>> getCryptocurrencyById(String id);

  /// 🧹 Clear cached data (like asking "Give me fresh prices")
  ///
  /// 🔄 Clears: Old price data, cached results
  /// ⚡ Purpose: Get latest real-time data
  /// 🎯 Perfect for: Pull-to-refresh functionality
  Future<void> clearCache();
}
