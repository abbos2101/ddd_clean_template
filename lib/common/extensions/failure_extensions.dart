import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';

import '../words/words.dart';
import 'feedback_helpers.dart';

class ErrorHandler {
  static String errorMsg(dynamic e) {
    if (e is DioException) {
      if (e.response != null) {
        if (e.response!.data is Map && e.response!.data['message'] != null) {
          return e.response!.data['message'];
        }
        return "${e.response!.statusCode}: ${e.response!.statusMessage}\n${e.response!.data}";
      }

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return Words.noInternet.str;

        default:
          return '$e';
      }
    }
    return '$e';
  }

  static void showError(String str) {
    showSnackBar(
      router.navigatorKey.currentContext!,
      message: str,
      type: SnackBarType.error,
    );
    if (kDebugMode) print(StackTrace.current);
  }
}
