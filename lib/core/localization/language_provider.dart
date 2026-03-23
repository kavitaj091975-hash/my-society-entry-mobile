import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Trigger to rebuild UI when language changes
final languageChangeProvider = StateProvider<int>((ref) => 0);

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier(ref);
});

class LanguageNotifier extends StateNotifier<Locale> {
  static const String _languageKey = 'app_language';
  final Ref ref;

  LanguageNotifier(this.ref) : super(const Locale('en')) {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString(_languageKey) ?? 'en';
      state = Locale(languageCode);
    } catch (e) {
      print('Error loading saved language: $e');
    }
  }

  Future<void> setLanguage(String languageCode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, languageCode);
      state = Locale(languageCode);
      // Trigger rebuild by incrementing provider
      ref.read(languageChangeProvider.notifier).state++;
    } catch (e) {
      print('Error setting language: $e');
    }
  }

  List<LanguageOption> getSupportedLanguages() {
    return [
      LanguageOption(code: 'en', name: 'English', flag: '🇬🇧'),
      LanguageOption(code: 'hi', name: 'हिन्दी', flag: '🇮🇳'),
      LanguageOption(code: 'mr', name: 'मराठी', flag: '🇮🇳'),
      LanguageOption(code: 'bn', name: 'বাংলা', flag: '🇧🇩'),
      LanguageOption(code: 'ta', name: 'தமிழ்', flag: '🇮🇳'),
      LanguageOption(code: 'te', name: 'తెలుగు', flag: '🇮🇳'),
      LanguageOption(code: 'gu', name: 'ગુજરાતી', flag: '🇮🇳'),
      LanguageOption(code: 'kn', name: 'ಕನ್ನಡ', flag: '🇮🇳'),
    ];
  }
}

class LanguageOption {
  final String code;
  final String name;
  final String flag;

  LanguageOption({required this.code, required this.name, required this.flag});
}
