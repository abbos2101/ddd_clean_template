import 'package:bloc/bloc.dart';
import 'package:ddd_clean_template/application/var_status.dart';
import 'package:ddd_clean_template/domain/facades/fake_facade.dart';
import 'package:ddd_clean_template/domain/models/quote_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'demo_cubit.freezed.dart';

part 'demo_state.dart';

@Injectable()
class DemoCubit extends Cubit<DemoState> {
  final FakeFacade _facade;

  DemoCubit(this._facade) : super(const DemoState.initial());

  Future<void> refresh(
    RefreshController controller, {
    bool clearCache = true,
  }) async {
    emit(state.copyWith(skip: 0, quotes: []));
    if (clearCache) await _facade.clearAllCache();
    await nextQuotes(controller);
  }

  Future<void> nextQuotes(RefreshController controller) async {
    emit(state.copyWith(quotesStatus: VarStatus.loading()));
    final response = await _facade.quotes(skip: state.skip);

    response.fold(
      (l) {
        emit(state.copyWith(quotesStatus: VarStatus.fail(l)));
        controller.refreshFailed();
        controller.loadFailed();
      },
      (r) {
        emit(
          state.copyWith(
            quotesStatus: VarStatus.success(),
            quotes: [...state.quotes, ...r],
            skip: state.skip + r.length,
          ),
        );
        controller.refreshCompleted();
        controller.loadComplete();
      },
    );
  }
}
