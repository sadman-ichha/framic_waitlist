import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;
  final Widget? counterWidget;
  final String title;

  const CustomAppBar({
    super.key,
    required this.isDark,
    required this.onThemeToggle,
    this.counterWidget,
    this.title = 'Framic',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Update status bar icons dynamically
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
    ));

    return AppBar(
      elevation: 1,
      scrolledUnderElevation: 0,
      backgroundColor: isDark ? Colors.transparent : const Color(0xFFB9AAF9), // AppColors.primary
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: .0),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
      iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
      actions: [
        if (counterWidget != null) counterWidget!,
        IconButton(
          tooltip: 'Toggle theme',
          onPressed: () {
            HapticFeedback.lightImpact();
            onThemeToggle();
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: animation,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              key: ValueKey(isDark),
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
