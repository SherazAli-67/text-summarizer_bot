import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../res/api_constant.dart';

class ApiService {

  // Singleton instance
  static final ApiService _instance = ApiService._internal();

  // Factory constructor
  factory ApiService() {
    return _instance;
  }

  // Private constructor
  ApiService._internal();
  final String _baseUrl = ApiConstants.baseUrl;

  Future<http.Response> postRequest({required String endpoint, required Map<String, dynamic> data, }) async {
    var url = Uri.parse(_baseUrl + endpoint);
    Map<String, String> headers =  await _getApiHeader();
    debugPrint("Post request url: $url\nData: $data\nHeaders: $headers");

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    debugPrint("Post request response: ${response.body}");
    return response;
  }

  Future<http.Response?> getRequest({required String endpoint,}) async {
    var url = Uri.parse(ApiConstants.baseUrl + endpoint);
    debugPrint("Get URL: $url");

   /* SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    if(token != null){
      final headers = await _getApiHeaderWithBearerToken(token);
      final response = await http.get(
        url,
        headers: headers,
      );
      return response;
    }
*/
    return null;
  }

  Future<Map<String, String>> _getApiHeader() async {
    return {'Content-Type': 'application/json',};
  }

}