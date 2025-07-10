import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_model.freezed.dart';

part 'quote_model.g.dart';

@freezed
abstract class QuoteModel with _$QuoteModel {
  const factory QuoteModel({
    @Default(0) int id,
    @Default('') String quote,
    @Default('') String author,
  }) = _QuoteModel;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);
}
