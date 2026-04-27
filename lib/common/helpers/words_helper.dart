import 'package:ddd_clean_template/common/words/words.dart';
import 'package:ddd_clean_template/presentation/dialogs/select_item_dialog.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class WordsHelper {
  const WordsHelper._();

  static Future<Locale?> showSelect(BuildContext context) async {
    final locale = await SelectItemDialog<Locale>(
      selected: context.locale,
      mode: SelectItemMode.wrap,
      labelFrom: (e) => e.languageCode.str,
      fetchItems: () => router.navigatorKey.currentContext!.supportedLocales,
      itemBuilder: (e, isSelected) {
        return Text(
          e.languageCode.str,
          style: TextStyle(
            fontSize: 20,
            fontWeight: isSelected ? .w600 : .w300,
          ),
        );
      },
    ).show(context);

    if (locale != null) {
      await context.setLocale(locale);
    }
    return locale;
  }
}
