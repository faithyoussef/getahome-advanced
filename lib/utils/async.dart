
enum AsyncValueStatus {loading, done, error}

class AsyncValue<T> {
  late AsyncValueStatus status;
  String? message;
  T? data;

  AsyncValue.loading([this.message = "", this.data])
      : status = AsyncValueStatus.loading; //case1
  AsyncValue.done(this.data) : status = AsyncValueStatus.done; //case2
  AsyncValue.error(this.message) : status = AsyncValueStatus.error; //case3
  R when<R>(
      {required R Function(String?) loading,
        required R Function(T) done,
        R Function(String?)? error}) {
    try {
      switch (status) {
        case AsyncValueStatus.loading:
          return loading(message);
        case AsyncValueStatus.done:
          return done(data!);
        case AsyncValueStatus.error:
          return error!(message);
      }
    } catch (e) {
      throw Exception("@{$status}-$e");
    }
  }
  @override
  String toString() =>
      'AsyncValue(status: $status, data:$data, message:$message)';

}