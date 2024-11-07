
import 'dart:convert';

class ErrorMessage {
  final String field;
  final String message;

  ErrorMessage({required this.field, required this.message});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    String fieldName = json.keys.first;
    String fieldMessage = json[fieldName][0]; 

    return ErrorMessage(
      field: fieldName,
      message: fieldMessage,
    );
  }

  @override
  String toString() {
    return '$field: $message';
  }
}


ErrorMessage? extractErrorMessage(dynamic jsonstr) {
  final Map<String, dynamic> responseBody = json.decode(jsonstr);
  if (responseBody.containsKey('error')) {
    final errorMap = responseBody['error'] as Map<String, dynamic>;

    if (errorMap.isNotEmpty) {
      return ErrorMessage.fromJson(errorMap);
    }
  }
  return null; 
}