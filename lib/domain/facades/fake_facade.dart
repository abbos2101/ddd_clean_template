import 'package:ddd_clean_template/domain/models/quote_model.dart';

abstract class FakeFacade {
  Future<List<QuoteModel>> quotes({
    int skip = 0,
    Duration cacheDuration = const Duration(hours: 1),
  });
}
