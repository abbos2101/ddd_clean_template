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
    return BlocProvider(
      create: (context) => di<CryptoCubit>()..loadTopCryptocurrencies(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            // 🔄 DYNAMIC - Fresh theme colors every time!
            final colorScheme = Theme.of(context).colorScheme;
            final isDark = Theme.of(context).brightness == Brightness.dark;

            return Container(
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
                bottom: false,
                child: BlocBuilder<CryptoCubit, CryptoCubitState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        // 🎯 Beautiful Header
                        const CryptoHeader(),

                        // 🔍 Search Bar
                        CryptoSearchBar(state: state),

                        // 📊 Content Area
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              color: colorScheme
                                  .surface, // 🎨 Theme-aware background
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: CryptoContent(state: state),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
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
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
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
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
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
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: progress / 100,
                backgroundColor: colorScheme.surfaceVariant,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
              ),
              const SizedBox(height: 10),
              Text(
                'Loading crypto data... ${progress.toStringAsFixed(0)}%',
                style: TextStyle(
                  color: colorScheme.onSurface.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
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
                          color: colorScheme.onSurface.withOpacity(0.6),
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
                    style: TextStyle(
                      fontSize: 14,
                      color: colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Market Cap: ${crypto.formattedMarketCap}',
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurface.withOpacity(0.6),
                    ),
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
                color: isFavorite
                    ? Colors.orange
                    : colorScheme.onSurface.withOpacity(0.6),
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
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        return Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Icon(
                Icons.search_off,
                size: 60,
                color: colorScheme.onSurface.withOpacity(0.5),
              ),
              const SizedBox(height: 20),
              Text(
                'No cryptocurrencies found',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Try a different search term',
                style: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// 🎯 Beautiful Header Widget (Class-based)
class CryptoHeader extends StatelessWidget {
  const CryptoHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
}

/// 🔍 Search Bar Widget (Class-based)
class CryptoSearchBar extends StatelessWidget {
  final CryptoCubitState state;

  const CryptoSearchBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
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
}

/// 📊 Main Content Widget (Class-based)
class CryptoContent extends StatelessWidget {
  final CryptoCubitState state;

  const CryptoContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<CryptoCubit>().refreshData(),
      child: CustomScrollView(
        slivers: [
          // 📊 Stats header
          SliverToBoxAdapter(child: CryptoStatsHeader(state: state)),

          // 🔍 Search results or top cryptos
          if (state.searchQuery.isNotEmpty)
            CryptoSearchResults(state: state)
          else
            CryptoTopList(state: state),
        ],
      ),
    );
  }
}

/// 📊 Statistics Header Widget (Class-based)
class CryptoStatsHeader extends StatelessWidget {
  final CryptoCubitState state;

  const CryptoStatsHeader({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: CryptoStatCard(
              title: '🏆 Top Cryptos',
              value: '${state.topCryptocurrencies.length}',
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: CryptoStatCard(
              title: '⭐ Favorites',
              value: '${state.favoritesCount}',
              color: Colors.orange,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: CryptoStatCard(
              title: '🔍 Search',
              value: '${state.searchResults.length}',
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

/// 📊 Individual Stat Card Widget (Class-based)
class CryptoStatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const CryptoStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// 🔍 Search Results Widget (Class-based)
class CryptoSearchResults extends StatelessWidget {
  final CryptoCubitState state;

  const CryptoSearchResults({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
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
              loading: () => const CryptoLoadingCard(),
              success: () =>
                  CryptoCoinsList(cryptos: state.searchResults, state: state),
              fail: (error) => CryptoErrorCard(error: error.toString()),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🏆 Top Cryptocurrencies Widget (Class-based)
class CryptoTopList extends StatelessWidget {
  final CryptoCubitState state;

  const CryptoTopList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
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
                  CryptoLoadingProgress(progress: state.loadingProgress),
                  const CryptoLoadingCard(),
                ],
              ),
              success: () => CryptoCoinsList(
                cryptos: state.topCryptocurrencies,
                state: state,
              ),
              fail: (error) => CryptoErrorCard(error: error.toString()),
            ),
          ],
        ),
      ),
    );
  }
}

/// 📊 Loading Progress Widget (Class-based)
class CryptoLoadingProgress extends StatelessWidget {
  final double progress;

  const CryptoLoadingProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: progress / 100,
            backgroundColor: colorScheme.surfaceVariant,
            valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
          ),
          const SizedBox(height: 10),
          Text(
            'Loading crypto data... ${progress.toStringAsFixed(0)}%',
            style: TextStyle(
              color: colorScheme.onSurface.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

/// 📱 Cryptocurrency List Widget (Class-based)
class CryptoCoinsList extends StatelessWidget {
  final List<CryptoModel> cryptos;
  final CryptoCubitState state;

  const CryptoCoinsList({
    super.key,
    required this.cryptos,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (cryptos.isEmpty) {
      return const CryptoEmptyState();
    }

    return Column(
      children: cryptos
          .map((crypto) => CryptoCoinCard(crypto: crypto, state: state))
          .toList(),
    );
  }
}

/// 🪙 Cryptocurrency Card Widget (Class-based)
class CryptoCoinCard extends StatelessWidget {
  final CryptoModel crypto;
  final CryptoCubitState state;

  const CryptoCoinCard({super.key, required this.crypto, required this.state});

  @override
  Widget build(BuildContext context) {
    final bool isFavorite = state.favoriteCryptocurrencies.any(
      (fav) => fav.id == crypto.id,
    );
    final bool isPriceUp = crypto.isPriceUp;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: colorScheme.surface,
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
                          color: colorScheme.onSurface.withOpacity(0.6),
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
                    style: TextStyle(
                      fontSize: 14,
                      color: colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Market Cap: ${crypto.formattedMarketCap}',
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurface.withOpacity(0.6),
                    ),
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
                color: isFavorite
                    ? Colors.orange
                    : colorScheme.onSurface.withOpacity(0.6),
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 📥 Loading Card Widget (Class-based)
class CryptoLoadingCard extends StatelessWidget {
  const CryptoLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
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
  }
}

/// ❌ Error Card Widget (Class-based)
class CryptoErrorCard extends StatelessWidget {
  final String error;

  const CryptoErrorCard({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
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
          const Text(
            'Error',
            style: TextStyle(
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
}

/// 📋 Empty State Widget (Class-based)
class CryptoEmptyState extends StatelessWidget {
  const CryptoEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(
            Icons.search_off,
            size: 60,
            color: colorScheme.onSurface.withOpacity(0.5),
          ),
          const SizedBox(height: 20),
          Text(
            'No cryptocurrencies found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Try a different search term',
            style: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
