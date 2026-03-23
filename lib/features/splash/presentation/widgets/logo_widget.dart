import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  final bool showText;

  const LogoWidget({super.key, this.size = 120, this.showText = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo Image
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size / 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Image.asset(
            'assets/logo/mysociety_logo.png',
            fit: BoxFit.contain,
          ),
        ),
        if (showText) ...[
          const SizedBox(height: 16),
          // Logo Text
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'MySociety',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: const Color(0xFF2563EB),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Entry',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: const Color(0xFF10B981),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
