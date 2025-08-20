import 'package:flutter/material.dart';
import 'package:framic_waitlist/features/splash/views/splash_view.dart';
import 'package:provider/provider.dart';
import 'core/theme/theme_provider.dart';
import 'features/splash/provider/splash_provider.dart';
import 'features/waitlist/data/mock_api.dart';
import 'features/waitlist/provider/waitlist_provider.dart';
import 'features/waitlist/views/widgets/signup_form.dart';
import 'features/waitlist/views/widgets/counter_widget.dart';
import 'features/waitlist/waitlist_repository.dart';

void main() {
  final apiService = ApiService();
  final repo = WaitlistRepository(apiService);
  runApp(MyApp(repo: repo));
}

class MyApp extends StatelessWidget {
  final WaitlistRepository repo;
  const MyApp({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => WaitlistProvider(repo)),
        /// ThemeProvider inject
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Framic Waitlist',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.mode,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}

class WaitlistScreen extends StatelessWidget {
  const WaitlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Framic Waitlist'),
        actions: [CounterWidget()],
      ),
      body: const Padding(padding: EdgeInsets.all(16), child: SignupForm()),
    );
  }
}
