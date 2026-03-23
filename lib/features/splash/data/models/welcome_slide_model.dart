import 'package:flutter/material.dart';
import 'package:mysociety/features/splash/domain/entities/welcome_slide.dart';

class WelcomeSlideModel extends WelcomeSlide {
  WelcomeSlideModel({
    required super.id,
    required super.titleKey,
    required super.descriptionKey,
    required super.icon,
    required super.borderColor,
  });

  // Sample welcome slides data
  static List<WelcomeSlide> getSampleSlides() {
    return [
      WelcomeSlideModel(
        id: 0,
        titleKey: 'welcome_to_mysociety',
        descriptionKey: 'welcome_desc',
        icon: Icons.security,
        borderColor: const Color(0xFF2563EB),
      ),
      WelcomeSlideModel(
        id: 1,
        titleKey: 'visitor_management',
        descriptionKey: 'visitor_desc',
        icon: Icons.person_add,
        borderColor: const Color(0xFF10B981),
      ),
      WelcomeSlideModel(
        id: 2,
        titleKey: 'billing_management',
        descriptionKey: 'billing_desc',
        icon: Icons.payment,
        borderColor: const Color(0xFFF59E0B),
      ),
    ];
  }
}
