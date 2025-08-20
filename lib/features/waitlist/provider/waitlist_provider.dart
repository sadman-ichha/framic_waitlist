import 'dart:async';
import 'package:flutter/material.dart';
import '../waitlist_repository.dart';

enum SubmitStatus { idle, submitting, success, error }

class WaitlistProvider extends ChangeNotifier {
  final WaitlistRepository repo;
  int? _userCount;
  SubmitStatus _status = SubmitStatus.idle;
  String? _error;

  int? get userCount => _userCount;
  SubmitStatus get status => _status;
  String? get error => _error;

  WaitlistProvider(this.repo) {
    // Load initial counter quickly after construction
    scheduleMicrotask(refreshCount);
  }

  Future<void> refreshCount() async {
    try {
      _userCount = await repo.getUserCount();
      notifyListeners();
    } catch (_) {
      // Keep silently; could expose an error banner if needed
    }
  }

  Future<void> submit({required String email, String? name, BuildContext? context}) async {
    _status = SubmitStatus.submitting;
    _error = null;
    notifyListeners();

    try {
      await repo.signup(email: email, name: name);
      _status = SubmitStatus.success;

      // Optimistic increment
      _userCount = (_userCount ?? 0) + 1;

      notifyListeners();
    } catch (e) {
      _status = SubmitStatus.error;
      _error = e.toString();
      notifyListeners();
    }
  }

  void reset() {
    _status = SubmitStatus.idle;
    _error = null;
    notifyListeners();
  }
}