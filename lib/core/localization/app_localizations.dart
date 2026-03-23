import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  late Map<String, String> _translations;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Future<bool> load() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/translations/${locale.languageCode}.json',
      );
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      _translations = jsonMap.cast<String, String>();
      return true;
    } catch (e) {
      print('Error loading translations for ${locale.languageCode}: $e');
      return false;
    }
  }

  String translate(String key) {
    return _translations[key] ?? key;
  }

  String get(String key) => translate(key);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      'en',
      'hi',
      'mr',
      'bn',
      'ta',
      'te',
      'gu',
      'kn',
    ].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
