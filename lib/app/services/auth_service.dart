import 'package:http/http.dart' as http;
import 'package:waveline/app/global/constanta.dart';
class AuthService {
  Future<bool> login({required String email, required String password}) async {
    try{  
      Uri url = Uri.parse('$baseUrl/login');
      Map<String,dynamic> body = {
        "email" : email,
        "password" : password
      };
      var response = await http.post(url, body : body);
      if(response.statusCode == 200) {
        return true;
      }
      return false;
    }catch(e) {
      return throw Exception(e);
    }
  }
  Future<bool> register({required String email, required String password, required String fullName}) async{
    try{
      Uri url = Uri.parse('$baseUrl/register');
      Map<String,dynamic> body = {
        "email" : email, 
        "password" : password,
        "fullName" : fullName
      };
      var response =  await http.post(url, body: body);
      if(response.statusCode == 200) {
        return true;
      }
      return false;
    }catch(e){
      return throw Exception(e);
    }
  }
}