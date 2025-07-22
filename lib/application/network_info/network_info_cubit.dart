import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ddd_clean_template/common/theme/colors.dart';
import 'package:ddd_clean_template/common/words/words.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'network_info_cubit.freezed.dart';
part 'network_info_state.dart';

@Injectable()
class NetworkInfoCubit extends Cubit<NetworkInfoState> {
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  NetworkInfoCubit() : super(const NetworkInfoState.initial());

  void init() {
    _subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      final isConnected =
          result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.ethernet);
      _change(isConnected);
    });
  }

  void _change(bool isConnected) {
    if (state.isConnected != isConnected) {
      _showMessage(isConnected);
    }
    emit(state.copyWith(isConnected: isConnected));
  }

  void _showMessage(bool isConnected) {
    final context = router.navigatorKey.currentState?.context;
    if (context == null) return;

    final colors = AppColors.of(context);

    Fluttertoast.showToast(
      msg: isConnected ? Words.hasInternet.str : Words.noInternet.str,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: colors.divider,
      textColor: isConnected ? colors.success : colors.error,
      fontSize: 16.0,
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
