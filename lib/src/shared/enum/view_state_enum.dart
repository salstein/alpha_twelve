enum ViewState {
  idle,
  loading,
  success,
  error;

  bool get isIdle => this == ViewState.idle;

  bool get isSuccess => this == ViewState.success;

  bool get isError => this == ViewState.error;

  bool get isLoading => this == ViewState.loading;
}
