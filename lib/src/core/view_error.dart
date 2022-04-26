class ViewError {
  int code = -1;
  String message = "Unknown error";

  ViewError({int? code, String? message}) {
    this.code = code ?? this.code;
    this.message = message ?? this.message;
  }
}
