import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:deliveryman_app/helper/error_message_extractor.dart';
import 'package:http/http.dart' as http;

import '../logger.dart';
import '../request_return_object.dart';

abstract class DynamicPostRequest {
  /// post api caller with direct map
  /// Sends data directly without using multipart
  static Future<NetworkCallerReturnObject> execute(
      String url, Map<String, dynamic> data,
      {String? token,
      VoidCallback? onUnAuthorized,
      bool? isLogin}) async {
    try {
      log("Request URL => $url");
      logger.w(data);
      Uri uri = Uri.parse(url);
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      if (token != null) headers['Authorization'] = 'Bearer $token';

      // Convert the data map to JSON string
      final body = jsonEncode(data);

      // Send the POST request
      final response = await http.post(uri, headers: headers, body: body);
      logger.d(response.statusCode);
      logger.d(token);
      final responseData = response.body;
      logger.d(responseData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson = json.decode(responseData);
        logger.d(decodedJson);
        return NetworkCallerReturnObject(
            errorMessage: '',
            returnValue: decodedJson,
            success: true,
            responseCode: response.statusCode);
      } else if (response.statusCode == 401) {
        if ((isLogin ?? false) == false) {
          if (onUnAuthorized != null) onUnAuthorized();
        }
        return NetworkCallerReturnObject(
            errorMessage: 'Unauthorized Request(Please login again with correct credentials)',
            returnValue: '',
            success: false,
            responseCode: response.statusCode);
      }
       else if (response.statusCode == 400) {
        final ErrorMessage? errorMessage = extractErrorMessage(responseData);
        return NetworkCallerReturnObject(
            errorMessage:errorMessage?.message?? 'Status code ${response.statusCode}(Bad Request)',
            returnValue: '',
            success: false,
            responseCode: response.statusCode);
      }
      else if (response.statusCode == 500) {
        return NetworkCallerReturnObject(
            errorMessage: 'Status code ${response.statusCode}(Internal Server Error)',
            returnValue: '',
            success: false,
            responseCode: response.statusCode);
      }
      else {
        // Handle non-200 and non-401 responses
        final responseContentType = response.headers['content-type'];
        dynamic decodedJson;
        try {
          if (responseContentType != null && responseContentType.contains('application/json')) {
            decodedJson = json.decode(responseData);
          } else {
            decodedJson = responseData; // If response is not JSON, keep it as string
          }
        } catch (e) {
          decodedJson = responseData; // Fallback to raw response in case of JSON parse error
        }
        logger.w(decodedJson);
        return NetworkCallerReturnObject(
            errorMessage: 'Status code ${response.statusCode}',
            returnValue: decodedJson,
            success: false,
            responseCode: response.statusCode);
      }
    } catch (e) {
      logger.e(e);
      return NetworkCallerReturnObject(
          errorMessage: e.toString(),
          returnValue: "",
          success: false,
          responseCode: 400);
    }
  }
}
