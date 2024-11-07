class ApiResponse<T> {
  final bool success;
  final T? data;   
  final String? error;    
  final int responseCode;  

  ApiResponse({required this.success, this.data, this.error, required this.responseCode});

  factory ApiResponse.success(T data, {required int responseCode}) {
    return ApiResponse(success: true, data: data, responseCode: responseCode);
  }

  factory ApiResponse.error(String errorMessage, {required int responseCode}) {
    return ApiResponse(success: false, error: errorMessage, responseCode: responseCode);
  }

  bool get isSuccess => success;
}
