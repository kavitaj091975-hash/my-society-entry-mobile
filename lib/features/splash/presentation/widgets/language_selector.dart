import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysociety/core/localization/language_provider.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageProvider);
    final languageNotifier = ref.read(languageProvider.notifier);
    final supportedLanguages = languageNotifier.getSupportedLanguages();

    return PopupMenuButton<String>(
      onSelected: (String languageCode) {
        languageNotifier.setLanguage(languageCode);
      },
      itemBuilder: (BuildContext context) {
        return supportedLanguages.map((option) {
          return PopupMenuItem<String>(
            value: option.code,
            child: Row(
              children: [
                Text(option.flag, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 8),
                Text(option.name),
              ],
            ),
          );
        }).toList();
      },
      icon: const Icon(Icons.language, size: 24),
      tooltip: 'Select Language',
      position: PopupMenuPosition.under,
    );
  }
}
