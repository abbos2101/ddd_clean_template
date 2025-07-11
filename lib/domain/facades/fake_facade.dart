import 'package:dartz/dartz.dart';
import 'package:ddd_clean_template/domain/models/quote_model.dart';

abstract class FakeFacade {
  Future<Either<dynamic, List<QuoteModel>>> quotes({
    int skip = 0,
    Duration cacheDuration = const Duration(hours: 1),
  });

  Future<void> clearAllCache();
}
