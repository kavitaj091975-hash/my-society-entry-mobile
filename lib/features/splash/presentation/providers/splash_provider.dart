import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysociety/features/splash/data/models/welcome_slide_model.dart';
import 'package:mysociety/features/splash/domain/entities/welcome_slide.dart';

// Current page index provider
final currentPageProvider = StateProvider<int>((ref) => 0);

// Welcome slides provider
final welcomeSlidesProvider = Provider<List<WelcomeSlide>>((ref) {
  return WelcomeSlideModel.getSampleSlides();
});

// Splash completed provider
final splashCompletedProvider = StateProvider<bool>((ref) => false);
