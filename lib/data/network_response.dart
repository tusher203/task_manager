class NetworkResponse {
  final int?statusCode;
  final bool isSuccess;
  final Map<String, dynamic>?jsonResponse;
  final String errorMessage;

  NetworkResponse(
      {this.errorMessage = 'Something went wrong', this.statusCode = -1, required this.isSuccess, this.jsonResponse});
}

