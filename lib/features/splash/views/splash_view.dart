import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:framic_waitlist/core/constants/colors.dart';
import '../provider/splash_provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  double _scale = 0.8;

  @override
  void initState() {
    super.initState();

    // Start splash timer
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    splashProvider.startTimer(context);

    // Animate after a short delay
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1;
        _scale = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SafeArea(
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutBack,
            tween: Tween<double>(begin: _scale, end: _scale),
            builder: (context, double scale, child) {
              return Transform.scale(
                scale: scale,
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/framic.webp", scale: 1.3),
                      const SizedBox(height: 10),
                      Text(
                        "Framic",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
