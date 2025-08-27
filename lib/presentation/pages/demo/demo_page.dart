import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ddd_clean_template/application/theme/theme_cubit.dart';
import 'package:ddd_clean_template/common/theme/themes.dart';
import 'package:ddd_clean_template/common/widgets/app_refresh.dart';
import 'package:ddd_clean_template/common/widgets/app_theme_switch.dart';
import 'package:ddd_clean_template/di.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/demo_cubit.dart';

@RoutePage()
class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<DemoCubit>()..refresh(),
      child: BlocBuilder<DemoCubit, DemoState>(
        builder: (context, state) {
          final cbt = context.read<DemoCubit>();

          return Scaffold(
            appBar: AppBar(title: TextField(controller: cbt.textController)),
            body: Builder(
              builder: (context) {
                if (state.quotesStatus.isLoading && state.quotes.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    // 🎆 Beautiful Navigation Bar
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // 📱 Top row with navigation buttons
                          Row(
                            children: [
                              Expanded(
                                child: _buildNavButton(
                                  context,
                                  'Posts API',
                                  Icons.article_outlined,
                                  const Color(0xFF4285F4),
                                  () => context.router.push(const PostsRoute()),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildNavButton(
                                  context,
                                  'Users',
                                  Icons.people_outline,
                                  const Color(0xFF34A853),
                                  () => context.router.push(const UsersRoute()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // 💰 Bottom row with crypto and theme
                          Row(
                            children: [
                              Expanded(
                                child: _buildNavButton(
                                  context,
                                  '🪙 Crypto',
                                  Icons.currency_bitcoin,
                                  const Color(0xFFFF6B35),
                                  () =>
                                      context.router.push(const CryptoRoute()),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // 🌕 Beautiful Theme Switch
                              const AppThemeSwitch(width: 100, height: 48),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: AppRefresh(
                        controller: cbt.refreshController,
                        enabledNext: true,
                        enabledRefresh: true,
                        onRefresh: cbt.refresh,
                        onNext: cbt.nextQuotes,
                        child: ListView.separated(
                          itemCount: state.quotes.length,
                          separatorBuilder: (_, _) => const Divider(height: 12),
                          itemBuilder: (_, i) {
                            final model = state.quotes[i];
                            return ListTile(
                              onTap: () {},
                              title: Text(model.quote),
                              subtitle: Text(model.author),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  /// 🎨 Helper to build beautiful navigation buttons
  Widget _buildNavButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
