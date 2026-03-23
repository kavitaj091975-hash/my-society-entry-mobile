import 'package:flutter/material.dart';
import 'package:mysociety/core/localization/app_localizations.dart';
import 'package:mysociety/features/splash/domain/entities/welcome_slide.dart';

class WelcomeCard extends StatelessWidget {
  final WelcomeSlide slide;

  const WelcomeCard({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bordered icon container
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: slide.borderColor, width: 3),
              ),
              padding: const EdgeInsets.all(40),
              child: Icon(slide.icon, size: 80, color: slide.borderColor),
            ),
            const SizedBox(height: 48),
            // Title
            Text(
              AppLocalizations.of(context).translate(slide.titleKey),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Description
            Text(
              AppLocalizations.of(context).translate(slide.descriptionKey),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
