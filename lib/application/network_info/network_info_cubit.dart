import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ddd_clean_template/common/words/words.dart';

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
    Fluttertoast.showToast(
      msg: isConnected ? Words.hasInternet.str : Words.noInternet.str,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: const Color(0xFF111827),
      textColor: isConnected
          ? const Color(0xFF01DCBA)
          : const Color(0xFFF43F5E),
      fontSize: 16.0,
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
