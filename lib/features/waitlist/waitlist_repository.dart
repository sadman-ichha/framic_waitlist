import 'data/mock_api.dart';

class WaitlistRepository {
  final ApiService api;
  WaitlistRepository(this.api);

  Future<int> getUserCount() => api.getUserCount();

  Future<void> signup({required String email, String? name}) =>
      api.signup(email: email, name: name);
}
