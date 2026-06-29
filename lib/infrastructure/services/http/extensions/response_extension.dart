import 'package:dio/dio.dart';

extension ResponseExtension on Response {
  bool get isFromNetwork => extra['@fromNetwork@'] ?? true;
}
