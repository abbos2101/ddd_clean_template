import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../application/crypto/crypto_cubit.dart';
import '../../../application/var_status.dart';
import '../../../di.dart';
import '../../../domain/models/crypto_model.dart';

/// 🪙 CRYPTOCURRENCY PAGE - Beautiful Real-World Crypto App
/// Think of this like a "MODERN CRYPTO TRADING APP" 📱💰
///
/// 🏪 Simple App Metaphor:
/// - This is like a BEAUTIFUL CRYPTO EXCHANGE APP
/// - Shows: Live prices, search, favorites, beautiful cards
/// - Like: Coinbase, Binance, but simpler and more beautiful!
///
/// 🎨 Amazing UI/UX Features:
/// 1. 🌟 Beautiful gradient background
/// 2. 🎯 Modern card design with shadows
/// 3. 💚/🔴 Green/Red price indicators
/// 4. 🔍 Smooth search with debouncing
/// 5. ⭐ Interactive favorites system
/// 6. 📊 Loading animations
/// 7. 🔄 Pull-to-refresh
/// 8. 🖼️ Crypto logos and icons

@RoutePage()
class CryptoPage extends StatelessWidget {
  const CryptoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => di<CryptoCubit>()..loadTopCryptocurrencies(),
      child: Scaffold(
        body: Container(
          // 🌌 Beautiful theme-aware gradient background
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      const Color(0xFF1A1A2E), // Dark navy
                      const Color(0xFF16213E), // Darker blue
                    ]
                  : [
                      const Color(0xFF667eea), // Beautiful blue
                      const Color(0xFF764ba2), // Beautiful purple
                    ],
            ),
          ),
          child: SafeArea(
            child: BlocBuilder<CryptoCubit, CryptoCubitState>(
              builder: (context, state) {
                return Column(
                  children: [
                    // 🎯 Beautiful Header
                    _buildHeader(context),

                    // 🔍 Search Bar
                    _buildSearchBar(context, state),

                    // 📊 Content Area
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color:
                              colorScheme.surface, // 🎨 Theme-aware background
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: _buildContent(context, state),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// 🎯 Beautiful header with title and stats
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '🪙 Crypto Market',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Real-time cryptocurrency prices',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          // 🔄 Refresh button
          BlocBuilder<CryptoCubit, CryptoCubitState>(
            builder: (context, state) {
              return IconButton(
                onPressed: state.topCryptosStatus.isLoading
                    ? null
                    : () => context.read<CryptoCubit>().refreshData(),
                icon: AnimatedRotation(
                  turns: state.topCryptosStatus.isLoading ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// 🔍 Beautiful search bar
  Widget _buildSearchBar(BuildContext context, CryptoCubitState state) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (query) =>
            context.read<CryptoCubit>().searchCryptocurrencies(query),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: '🔍 Search cryptocurrencies...',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.7)),
          suffixIcon: state.searchQuery.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.white.withOpacity(0.7)),
                  onPressed: () => context.read<CryptoCubit>().clearSearch(),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }

  /// 📊 Main content area
  Widget _buildContent(BuildContext context, CryptoCubitState state) {
    return RefreshIndicator(
      onRefresh: () => context.read<CryptoCubit>().refreshData(),
      child: CustomScrollView(
        slivers: [
          // 📊 Stats header
          SliverToBoxAdapter(child: _buildStatsHeader(state)),

          // 🔍 Search results or top cryptos
          if (state.searchQuery.isNotEmpty)
            _buildSearchResults(context, state)
          else
            _buildTopCryptocurrencies(context, state),
        ],
      ),
    );
  }

  /// 📊 Statistics header
  Widget _buildStatsHeader(CryptoCubitState state) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              '🏆 Top Cryptos',
              '${state.topCryptocurrencies.length}',
              Colors.blue,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: _buildStatCard(
              '⭐ Favorites',
              '${state.favoritesCount}',
              Colors.orange,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: _buildStatCard(
              '🔍 Search',
              '${state.searchResults.length}',
              Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  /// 📊 Individual stat card
  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// 🔍 Search results section
  Widget _buildSearchResults(BuildContext context, CryptoCubitState state) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🔍 Search Results for "${state.searchQuery}"',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            state.searchStatus.when(
              initial: () => const SizedBox(),
              loading: () => _buildLoadingCard(),
              success: () =>
                  _buildCryptoList(context, state.searchResults, state),
              fail: (error) => _buildErrorCard(error.toString()),
            ),
          ],
        ),
      ),
    );
  }

  /// 🏆 Top cryptocurrencies section
  Widget _buildTopCryptocurrencies(
    BuildContext context,
    CryptoCubitState state,
  ) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🏆 Top Cryptocurrencies',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            state.topCryptosStatus.when(
              initial: () => const SizedBox(),
              loading: () => Column(
                children: [
                  _buildLoadingProgress(state.loadingProgress),
                  _buildLoadingCard(),
                ],
              ),
              success: () =>
                  _buildCryptoList(context, state.topCryptocurrencies, state),
              fail: (error) => _buildErrorCard(error.toString()),
            ),
          ],
        ),
      ),
    );
  }

  /// 📊 Loading progress bar
  Widget _buildLoadingProgress(double progress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: progress / 100,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF667eea)),
          ),
          const SizedBox(height: 10),
          Text(
            'Loading crypto data... ${progress.toStringAsFixed(0)}%',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }

  /// 📱 Cryptocurrency list
  Widget _buildCryptoList(
    BuildContext context,
    List<CryptoModel> cryptos,
    CryptoCubitState state,
  ) {
    if (cryptos.isEmpty) {
      return _buildEmptyState();
    }

    return Column(
      children: cryptos
          .map((crypto) => _buildCryptoCard(context, crypto, state))
          .toList(),
    );
  }

  /// 🪙 Beautiful cryptocurrency card
  Widget _buildCryptoCard(
    BuildContext context,
    CryptoModel crypto,
    CryptoCubitState state,
  ) {
    final bool isFavorite = state.favoriteCryptocurrencies.any(
      (fav) => fav.id == crypto.id,
    );
    final bool isPriceUp = crypto.isPriceUp;
    final colorScheme = Theme.of(context).colorScheme; // 🎨 Get theme colors

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: colorScheme.surface, // 🎨 Theme-aware card background
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            // 🖼️ Crypto logo
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: crypto.image != null
                    ? CachedNetworkImage(
                        imageUrl: crypto.image!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.currency_bitcoin),
                      )
                    : const Icon(Icons.currency_bitcoin, size: 30),
              ),
            ),
            const SizedBox(width: 15),

            // 💰 Crypto info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        crypto.rankDisplay,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          crypto.name ?? 'Unknown',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    (crypto.symbol ?? '').toUpperCase(),
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Market Cap: ${crypto.formattedMarketCap}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),

            // 📊 Price info
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  crypto.formattedPrice,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isPriceUp
                        ? Colors.green.withOpacity(0.1)
                        : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${crypto.priceEmoji} ${crypto.formattedPriceChange}',
                    style: TextStyle(
                      fontSize: 12,
                      color: isPriceUp ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // ⭐ Favorite button
            IconButton(
              onPressed: () =>
                  context.read<CryptoCubit>().toggleFavorite(crypto),
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: isFavorite ? Colors.orange : Colors.grey,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 📥 Loading card
  Widget _buildLoadingCard() {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colorScheme.surface, // 🎨 Theme-aware background
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: colorScheme.primary),
              const SizedBox(width: 15),
              Text(
                'Loading cryptocurrencies...',
                style: TextStyle(color: colorScheme.onSurface),
              ),
            ],
          ),
        );
      },
    );
  }

  /// ❌ Error card
  Widget _buildErrorCard(String error) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Icon(Icons.error, color: Colors.red, size: 40),
          const SizedBox(height: 10),
          Text(
            'Error',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            error,
            style: TextStyle(color: Colors.red[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// 📭 Empty state
  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Icon(Icons.search_off, size: 60, color: Colors.grey),
          const SizedBox(height: 20),
          const Text(
            'No cryptocurrencies found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Try a different search term',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
