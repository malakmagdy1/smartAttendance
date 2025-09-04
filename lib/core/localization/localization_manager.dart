import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared_preferences/prefs_keys.dart';
import '../shared_preferences/shared_prefs.dart';
import 'app_localizations.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit([this._sharedPrefs]) : super(const Locale('en')) {
    appLocalizations = lookupAppLocalizations(state);
    initLocale();
  }

  late AppLocalizations appLocalizations = lookupAppLocalizations(state);

  final SharedPrefs? _sharedPrefs; // now nullable

  Future<void> initLocale() async {
    // If SharedPrefs is null, just use default locale
    if (_sharedPrefs == null) return;

    final String? languageCode =
    _sharedPrefs!.getString(key: PrefsKeys.languageCode);

    if (kDebugMode) {
      await _sharedPrefs!.remove(key: PrefsKeys.languageCode);

      /// TODO: بدل toEnglish ممكن تخليها toArabic لو عايز العربي الافتراضي
      toEnglish();
      return;
    }

    if (languageCode != null) {
      emit(Locale(languageCode));
      appLocalizations = lookupAppLocalizations(Locale(languageCode));
    } else {
      const locale = Locale('ar');
      emit(locale);
      appLocalizations = lookupAppLocalizations(locale);

      _sharedPrefs!.saveString(
          key: PrefsKeys.languageCode, value: locale.languageCode);
    }
  }

  void toArabic() {
    appLocalizations = lookupAppLocalizations(const Locale('ar'));
    emit(const Locale('ar'));
    _sharedPrefs?.saveString(key: PrefsKeys.languageCode, value: 'ar');
  }

  void toEnglish() {
    appLocalizations = lookupAppLocalizations(const Locale('en'));
    emit(const Locale('en'));
    _sharedPrefs?.saveString(key: PrefsKeys.languageCode, value: 'en');
  }

  TextDirection getTextDirection([TextDirection? textDirection]) {
    if (textDirection != null) return textDirection;
    return state.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
  }
}
