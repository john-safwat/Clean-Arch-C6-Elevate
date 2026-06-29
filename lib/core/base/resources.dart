enum Status { success, loading, error, init }

class Resources<T> {
  String? message;
  Exception? exception;
  T? data;
  Status status;

  Resources._(): status = Status.init;

  Resources.init() : status = Status.init;

  Resources.loading() : status = Status.loading;

  Resources.error({this.message, this.data, this.exception})
    : status = Status.error;

  Resources.success({this.data}) : status = Status.success;
}
