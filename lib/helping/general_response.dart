enum Status {
  SUCCESS,
  FAILED,
  LOADING,
}

class GeneralResponse {
  String? message;
  Status? status;
  String? body;
  String? errorBody;
  GeneralResponse({this.message,this.status,this.body,this.errorBody});
}
