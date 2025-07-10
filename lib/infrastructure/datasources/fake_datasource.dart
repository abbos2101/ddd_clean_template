import 'package:injectable/injectable.dart';
import 'package:ddd_clean_template/domain/facades/fake_facade.dart';
import 'package:ddd_clean_template/domain/models/quote_model.dart';

import '../services/http/http_service.dart';

@Injectable(as: FakeFacade)
class FakeDatasource implements FakeFacade {
  final HttpService _httpService;

  const FakeDatasource(this._httpService);

  @override
  Future<List<QuoteModel>> quotes({
    int skip = 0,
    Duration cacheDuration = const Duration(hours: 1),
  }) async {
    const path = '/quotes';
    final queryParameters = {'skip': '$skip'};
    final client = _httpService.client(
      requiredToken: false,
      cacheDuration: cacheDuration,
    );

    final response = await client.get(path, queryParameters: queryParameters);

    return response.data['quotes']
        .map<QuoteModel>((e) => QuoteModel.fromJson(e))
        .toList();
  }
}
