enum WaitlistStatus { initial, loading, success, error }

class WaitlistState {
  final WaitlistStatus status;
  final String? errorMessage;

  const WaitlistState({
    this.status = WaitlistStatus.initial,
    this.errorMessage,
  });

  WaitlistState copyWith({
    WaitlistStatus? status,
    String? errorMessage,
  }) {
    return WaitlistState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
