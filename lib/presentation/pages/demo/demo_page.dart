import 'package:auto_route/annotations.dart';
import 'package:ddd_clean_template/common/widgets/app_refresh.dart';
import 'package:ddd_clean_template/di.dart';
import 'package:flutter/material.dart';
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

                return AppRefresh(
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
                        title: Text(model.quote),
                        subtitle: Text(model.author),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
