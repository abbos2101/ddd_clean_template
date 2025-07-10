part of 'device_info_cubit.dart';

@freezed
abstract class DeviceInfoState with _$DeviceInfoState {
  const factory DeviceInfoState.initial({
    /// checkNotJailBroken
    @Default(VarStatus()) VarStatus checkNotJailBrokenStatus,

    /// checkRealDevice
    @Default(VarStatus()) VarStatus checkRealDeviceStatus,

    /// checkRealLocation
    @Default(VarStatus()) VarStatus checkRealLocationStatus,

    /// projectInfo
    @Default(VarStatus()) VarStatus projectInfoStatus,
    required PackageInfo projectInfo,
  }) = _Initial;
}
