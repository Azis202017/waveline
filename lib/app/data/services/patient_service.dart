import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../global/constanta.dart';
import '../model/patient.dart';

class PatientService {
  Future<Patient?> listOfPatient() async {
    GetStorage storage = GetStorage();
    try {
      Uri uri = Uri.parse(
        '$baseUrl/get-patient',
      );
      http.Response response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer ${storage.read('token')}',
        },
      );
      print(json.decode(response.body)['user']);
      if (response.statusCode == 200) {
        return Patient.fromJson(json.decode(response.body)['user'][0]);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
