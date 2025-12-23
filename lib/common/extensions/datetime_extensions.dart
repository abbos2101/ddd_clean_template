import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get dateStr => DateFormat(
    'dd.MM.yyyy',
    router.navigatorKey.currentContext?.locale.languageCode,
  ).format(this);

  String get dateTimeStr => DateFormat(
    'dd.MM.yyyy HH:mm',
    router.navigatorKey.currentContext?.locale.languageCode,
  ).format(this);
}

extension DateTimeParsingExtension on String {
  DateTime? get toDateTime => DateTime.tryParse(this);

  DateTime? get toDateOnly {
    final date = DateTime.tryParse(this);
    if (date == null) {
      return null;
    }
    return DateTime(date.year, date.month, date.day);
  }
}
