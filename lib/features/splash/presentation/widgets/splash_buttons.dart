import 'package:flutter/material.dart';
import 'package:mysociety/core/localization/app_localizations.dart';

class SplashButtons extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onNextPressed;
  final bool isLastPage;
  final bool isFirstPage;

  const SplashButtons({
    super.key,
    required this.onBackPressed,
    required this.onNextPressed,
    required this.isLastPage,
    required this.isFirstPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          SizedBox(
            width: 100,
            height: 50,
            child: OutlinedButton(
              onPressed: isFirstPage ? null : onBackPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: isFirstPage
                      ? Colors.grey[300]!
                      : const Color(0xFF2563EB),
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                AppLocalizations.of(context).translate('back'),
                style: TextStyle(
                  fontSize: 16,
                  color: isFirstPage ? Colors.grey : const Color(0xFF2563EB),
                ),
              ),
            ),
          ),
          // Next button
          SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(
              onPressed: onNextPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                isLastPage
                    ? AppLocalizations.of(context).translate('done')
                    : AppLocalizations.of(context).translate('next'),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
