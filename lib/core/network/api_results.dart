

sealed class ApiResults<T> {
  String? message;
  Exception? exception;
  T? data;

  ApiResults(this.message, this.exception, this.data);
}

class Success<T> extends ApiResults<T> {
  Success(T? data) : super(null, null, data);
}

class Failure<T> extends ApiResults<T> {
  Failure(String? message, Exception? exception)
    : super(message, exception, null);
}
