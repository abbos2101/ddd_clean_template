import 'package:ddd_clean_template/common/widgets/app_toast.dart';
import 'package:ddd_clean_template/common/words/words.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ErrorHelper {
  const ErrorHelper._();

  static String getErrorStr(dynamic e) {
    if (kDebugMode) {
      print(StackTrace.current);
    }

    if (e is DioException) {
      if (e.response != null) {
        if (e.response!.data is Map && e.response!.data['message'] != null) {
          return '${e.response!.statusCode}:${e.response!.data['message']}';
        }

        if (e.response!.statusCode! >= 500) {
          return Words.serverError.str;
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

  static void showError(String message) {
    AppToast.error(message);
  }
}

String getError(dynamic e) => ErrorHelper.getErrorStr(e);

void showError(dynamic e) => ErrorHelper.showError(e);
