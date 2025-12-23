import 'package:bloc/bloc.dart';
import 'package:ddd_clean_template/application/var_status.dart';
import 'package:ddd_clean_template/domain/facades/fake_facade.dart';
import 'package:ddd_clean_template/domain/models/quote_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'demo_cubit.freezed.dart';
part 'demo_state.dart';

@Injectable()
class DemoCubit extends Cubit<DemoState> {
  final FakeFacade _facade;
  final textController = TextEditingController();
  final refreshController = RefreshController();

  DemoCubit(this._facade) : super(const DemoState.initial()) {
    textController.addListener(nextQuotes);
  }

  Future<void> refresh() async {
    emit(state.copyWith(skip: 0, quotes: [], enableNext: true));
    await _facade.clearAllCache();
    await nextQuotes();
  }

  Future<void> nextQuotes() async {
    emit(state.copyWith(quotesStatus: VarStatus.loading()));
    final response = await _facade.quotes(skip: state.skip);

    response.fold(
      (l) {
        emit(state.copyWith(quotesStatus: VarStatus.fail(l.errorStr)));
        ErrorHelper.showError(l);
        refreshController
          ..refreshFailed()
          ..loadFailed();
      },
      (r) {
        emit(
          state.copyWith(
            quotesStatus: VarStatus.success(),
            enableNext: r.length < 30 ? false : true,
            quotes: [...state.quotes, ...r],
            skip: state.skip + r.length,
          ),
        );
        refreshController
          ..refreshCompleted()
          ..loadComplete();
      },
    );
  }

  @override
  Future<void> close() {
    textController.dispose();
    refreshController.dispose();
    return super.close();
  }
}
