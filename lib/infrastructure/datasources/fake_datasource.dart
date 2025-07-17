import 'package:dartz/dartz.dart';
import 'package:ddd_clean_template/domain/facades/fake_facade.dart';
import 'package:ddd_clean_template/domain/models/quote_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../services/http/http_service.dart';

@Injectable(as: FakeFacade)
class FakeDatasource implements FakeFacade {
  final HttpService _http;

  const FakeDatasource(this._http);

  @override
  Future<Either<dynamic, List<QuoteModel>>> quotes({
    int skip = 0,
    Duration cacheDuration = const Duration(hours: 1),
  }) async {
    final client = _http.client(
      requiredToken: false,
      cacheDuration: cacheDuration,
    );
    const path = '/quotes';
    final queryParameters = {'skip': '$skip'};

    try {
      final response = await client.get(
        path,
        options: Options(headers: {}),
        queryParameters: queryParameters,
      );

      final result = response.data['quotes']
          .map<QuoteModel>((e) => QuoteModel.fromJson(e))
          .toList();

      return right(result);
    } catch (e) {
      return left(e);
    }
  }

  @override
  Future<void> clearAllCache() async => await _http.clearCache();
}