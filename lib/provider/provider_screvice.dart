import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ApiProvider extends ChangeNotifier {
 Map<String, dynamic> _userdetails = {};
  Map get userData => _userdetails;

   userDetails(String userPhone, String password) async {
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


