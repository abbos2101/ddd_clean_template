part of 'network_info_cubit.dart';

@freezed
abstract class NetworkInfoState with _$NetworkInfoState {
  const factory NetworkInfoState.initial({@Default(false) bool isConnected}) =
      _Initial;
}
