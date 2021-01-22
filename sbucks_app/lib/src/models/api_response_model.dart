class ApiResponse<T> {
  Status status;
  String message;
  T body;

  ApiResponse.loading({this.message, this.body}) : status = Status.LOADING;

  ApiResponse.complete(this.body) : status = Status.COMPLETE;

  ApiResponse.error(this.message, {this.body}) : status = Status.ERROR;

  @override
  String toString() {
    return 'Status: $status, Message: $message, Body: $body';
  }
}

enum Status { LOADING, COMPLETE, ERROR }
