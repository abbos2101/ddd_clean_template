part of 'demo_cubit.dart';

@freezed
abstract class DemoState with _$DemoState {
  const factory DemoState.initial({
    @Default(0) int skip,
    @Default(VarStatus()) VarStatus quotesStatus,
    @Default([]) List<QuoteModel> quotes,
  }) = _Initial;
}
