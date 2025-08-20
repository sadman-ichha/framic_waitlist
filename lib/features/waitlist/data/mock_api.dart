import 'dart:async';

class ApiService {
  int _count = 1249; // starting demo count

  Future<int> getUserCount() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _count;
  }

  Future<void> signup({required String email, String? name}) async {
    await Future.delayed(const Duration(milliseconds: 700));

    if (email.toLowerCase().contains('fail')) {
      throw Exception('Mocked signup error');
    }
    _count += 1;
  }
}
