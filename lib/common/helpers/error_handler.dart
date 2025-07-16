import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../words/words.dart';
import 'feedback_helper.dart';

class ErrorHelper {
  const ErrorHelper._();

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

  static void showError(dynamic e) {
    FeedbackHelper.showSnackBar(
      router.navigatorKey.currentContext!,
      message: errorMsg(e),
      type: SnackBarType.error,
    );
    if (kDebugMode) print(StackTrace.current);
  }
}
