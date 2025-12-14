import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../words/words.dart';
import 'feedback_helper.dart';

class ErrorHelper {
  const ErrorHelper._();

  static String getError(dynamic e) {
    if (kDebugMode) {
      print(StackTrace.current);
    }

    if (e is DioException) {
      if (e.response != null) {
        if (e.response!.data is Map && e.response!.data['message'] != null) {
          return e.response!.data['message'];
        }
        return '${e.response!.statusCode}: ${e.response!.statusMessage}\n${e.response!.data}';
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
    FeedbackHelper.showSnackBar(message: getError(e), type: SnackBarType.error);
  }
}

String getError(dynamic e) => ErrorHelper.getError(e);

void showError(dynamic e) => ErrorHelper.showError(e);
