class NetworkResponse {
  final int? statusCode;
  final bool isSuccess;
  final Map<String, dynamic>? jsonResponse;
  final String? MessageError;

  NetworkResponse(
      {this.statusCode = -1,
        required this.isSuccess,
        this.jsonResponse,
        this.MessageError = 'Something went wrong'});
}
