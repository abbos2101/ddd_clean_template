import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:safe_device/safe_device.dart';

import '../var_status.dart';

part 'device_info_cubit.freezed.dart';

part 'device_info_state.dart';

@Injectable()
class DeviceInfoCubit extends Cubit<DeviceInfoState> {
  DeviceInfoCubit()
    : super(
        DeviceInfoState.initial(
          projectInfo: PackageInfo(
            appName: '',
            packageName: '',
            version: '',
            buildNumber: '',
          ),
        ),
      );

  Future<void> checkNotJailBroken() async {
    emit(state.copyWith(checkNotJailBrokenStatus: .loading()));
    final value = await SafeDevice.isJailBroken;
    emit(
      state.copyWith(
        checkNotJailBrokenStatus: value
            ? .fail('JailBroken found')
            : .success(),
      ),
    );
  }

  Future<void> checkRealDevice() async {
    emit(state.copyWith(checkRealDeviceStatus: .loading()));
    final value = await SafeDevice.isRealDevice;
    emit(
      state.copyWith(
        checkRealDeviceStatus: value
            ? .success()
            : .fail('This is not real device!'),
      ),
    );
  }

  Future<void> checkRealLocation() async {
    emit(state.copyWith(checkRealLocationStatus: .loading()));
    final value = await SafeDevice.isMockLocation;
    emit(
      state.copyWith(
        checkRealLocationStatus: value
            ? .fail('Location is not real!')
            : .success(),
      ),
    );
  }

  Future<void> projectInfo() async {
    emit(state.copyWith(projectInfoStatus: .loading()));
    final value = await PackageInfo.fromPlatform();
    emit(state.copyWith(projectInfoStatus: .success(), projectInfo: value));
  }
}
