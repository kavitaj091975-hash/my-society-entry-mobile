import 'package:flutter/material.dart';

class WelcomeSlide {
  final int id;
  final String titleKey;
  final String descriptionKey;
  final IconData icon;
  final Color borderColor;

  WelcomeSlide({
    required this.id,
    required this.titleKey,
    required this.descriptionKey,
    required this.icon,
    required this.borderColor,
  });
}
