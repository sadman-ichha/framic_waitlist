import 'package:flutter/material.dart';
import 'package:framic_waitlist/features/waitlist/views/widgets/counter_widget.dart';
import 'package:framic_waitlist/features/waitlist/views/widgets/custom_appbar.dart';
import 'package:framic_waitlist/features/waitlist/views/widgets/landing_section.dart';
import 'package:framic_waitlist/features/waitlist/views/widgets/signup_form.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/theme_provider.dart';

class WaitlistPage extends StatefulWidget {
  const WaitlistPage({super.key});

  @override
  State<WaitlistPage> createState() => _WaitlistPageState();
}

class _WaitlistPageState extends State<WaitlistPage> {
  final GlobalKey formKey = GlobalKey();

  void _scrollToForm() {
    final ctx = formKey.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0A0A0B)
          : const Color(0xFFFAFBFC),
      appBar: CustomAppBar(
        isDark: isDark,
        onThemeToggle: themeProvider.toggle,
        counterWidget: const CounterWidget(),
        title: 'Framic',
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 1024;
            final isMedium = constraints.maxWidth >= 768;

            final horizontalPadding = isWide ? 64.0 : (isMedium ? 32.0 : 8.0);
            final verticalPadding = isWide ? 40.0 : (isMedium ? 24.0 : 8.0);

            final padding = EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            );

            final content = isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: LandingSection(onCtaTap: _scrollToForm),
                      ),
                      const SizedBox(width: 48),
                      Expanded(
                        flex: 4,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: SignupForm(key: formKey),
                        ),
                      ),
                    ],
                  )
                : ListView(
                    padding: padding,
                    children: [
                      LandingSection(onCtaTap: _scrollToForm),
                      const SizedBox(height: 0),
                      SignupForm(key: formKey),
                    ],
                  );

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: Container(
                key: ValueKey(isWide),
                padding: padding,
                child: content,
              ),
            );
          },
        ),
      ),
    );
  }
}
