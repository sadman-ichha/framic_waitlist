import 'package:flutter/material.dart';

import '../../waitlist/views/waitlist_view.dart';

class SplashProvider with ChangeNotifier {
  bool _isDone = false;

  bool get isDone => _isDone;

  void startTimer(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 800), () {
      _isDone = true;
      notifyListeners();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WaitlistPage()),
      );
    });
  }
}
