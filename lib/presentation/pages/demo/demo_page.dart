import 'package:auto_route/annotations.dart';
import 'package:ddd_clean_template/common/widgets/app_refresh.dart';
import 'package:ddd_clean_template/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'demo_cubit.dart';

@RoutePage()
class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  late final cbt = di<DemoCubit>()..refresh(controller);
  final controller = RefreshController();

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cbt,
      child: BlocBuilder<DemoCubit, DemoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('$widget')),
            body: Builder(
              builder: (context) {
                if (state.quotesStatus.isLoading && state.quotes.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return AppRefresh(
                  controller: controller,
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
