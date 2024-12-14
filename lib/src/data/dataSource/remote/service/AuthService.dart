import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:safetrack/src/data/api/ApiConfig.dart';
import 'package:http/http.dart' as http;
import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/domain/utils/ListToString.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';

class Authservice {
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PORYECT, '/auth/login');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = json.encode({'email': email, 'password': password});
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        print('Data: ${authResponse.toJson()}}');

        return Success(authResponse);
      } else {
        return ErrorData(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return ErrorData(e.toString());
    }
  }
}
