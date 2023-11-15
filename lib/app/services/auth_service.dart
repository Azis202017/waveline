import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:waveline/app/global/constanta.dart';
class AuthService {
  Future<bool> login({required String email, required String password}) async {
    GetStorage storage = GetStorage();
    try{  
      Uri url = Uri.parse('$baseUrl/login-user');
      Map<String,dynamic> body = {
        "email" : email,
        "password" : password
      };
      var response = await http.post(url, body : body);
      print(response.body);

      if(response.statusCode == 200) {
        String token = json.decode(response.body)['access_token'];
        storage.write('token', 'Bearer $token');
        return true;
      }
      return false;
    }catch(e) {
      return throw Exception(e);
    }
  }
 
}