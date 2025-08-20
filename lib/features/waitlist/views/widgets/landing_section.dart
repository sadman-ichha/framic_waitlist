import 'package:flutter/material.dart';

import 'feature_item.dart';

class LandingSection extends StatelessWidget {
  final VoidCallback onCtaTap;

  const LandingSection({super.key, required this.onCtaTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                          Colors.purple.withValues(alpha: 0.1),
                          Colors.blue.withValues(alpha: 0.1),
                        ]
                      : [
                          Colors.purple.withValues(alpha: 0.05),
                          Colors.blue.withValues(alpha: 0.05),
                        ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: theme.colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.rocket_launch_rounded,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Coming Soon',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Hero Title
            Text(
              'Join the Future of Creative Tools',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                height: 1.1,
                color: theme.colorScheme.onSurface,
                letterSpacing: -1.2,
              ),
            ),

            const SizedBox(height: 10),

            // Subtitle
            Text(
              'Be among the first to experience our revolutionary platform. '
              'Join thousands of creators already on our waitlist.',
              style: TextStyle(
                fontSize: 13,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 25),

            // Feature highlights
            Column(
              children: [
                FeatureItem(
                  icon: Icons.auto_awesome,
                  title: 'AI-Powered Storage',
                  description:
                      'Organize and create stunning visuals with smart assistance',
                ),

                FeatureItem(
                  icon: Icons.bolt_rounded,
                  title: 'Effortless & Organized',
                  description:
                      'Enjoy real-time collaboration with instant results',
                ),

                FeatureItem(
                  icon: Icons.security_rounded,
                  title: 'Secure & Private',
                  description:
                      'Your data is protected with enterprise-grade security',
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
