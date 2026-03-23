import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:mysociety/core/localization/app_localizations.dart';
import 'package:mysociety/core/localization/language_provider.dart';
import 'package:mysociety/features/splash/presentation/providers/splash_provider.dart';
import 'package:mysociety/features/splash/presentation/widgets/welcome_card.dart';
import 'package:mysociety/features/splash/presentation/widgets/splash_buttons.dart';
import 'package:mysociety/features/splash/presentation/widgets/language_selector.dart';
import 'package:mysociety/features/splash/presentation/widgets/logo_widget.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch language change to trigger rebuild
    ref.watch(languageChangeProvider);

    final currentPage = ref.watch(currentPageProvider);
    final slides = ref.watch(welcomeSlidesProvider);
    final pageController = PageController();

    // Sync page controller with current page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (currentPage != pageController.page?.toInt()) {
        pageController.jumpToPage(currentPage);
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top header with logo and language selector
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LanguageSelector(),
                  const LogoWidget(size: 60, showText: false),
                  GestureDetector(
                    onTap: () {
                      _handleDone(context, ref);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            // Step counter
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '${AppLocalizations.of(context).translate('step')} ${currentPage + 1}/${slides.length}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            // PageView
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  ref.read(currentPageProvider.notifier).state = index;
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  return WelcomeCard(slide: slides[index]);
                },
              ),
            ),
            // Page Indicator
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: SmoothPageIndicator(
                controller: pageController,
                count: slides.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
                  activeDotColor: const Color(0xFF2563EB),
                  dotColor: Colors.grey[300]!,
                ),
              ),
            ),
            // Buttons
            SplashButtons(
              isFirstPage: currentPage == 0,
              isLastPage: currentPage == slides.length - 1,
              onBackPressed: () {
                if (currentPage > 0) {
                  ref.read(currentPageProvider.notifier).state =
                      currentPage - 1;
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              onNextPressed: () {
                if (currentPage == slides.length - 1) {
                  _handleDone(context, ref);
                } else {
                  ref.read(currentPageProvider.notifier).state =
                      currentPage + 1;
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleDone(BuildContext context, WidgetRef ref) {
    ref.read(splashCompletedProvider.notifier).state = true;
    // Navigate to home page or next screen
    // This is where you'd implement navigation to your main app
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).translate('welcome_text')),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
