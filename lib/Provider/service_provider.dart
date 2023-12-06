import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceProvider extends ChangeNotifier {
  int? _otpValue;
  String get OTP => _otpValue?.toString() ?? ""; // Convert int? to String
  void Otp(int value) {
    _otpValue = value;
    notifyListeners();
  }

  Map<String, dynamic> _userdetails = {};
  Map get userData => _userdetails;

  Future<void> userDetails(String userPhone, String password) async {
    final apiUrl = 'https://keerthiram.in/chitnew/api_customer.php';

    final response = await http.get(
      Uri.parse('$apiUrl?username=$userPhone&password=$password'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // Process the data as needed
      print('API Response: $data');
      _userdetails = data;
    } else {
      // Handle error
      print('API Request failed with status ${response.statusCode}');
    }
  }
}
