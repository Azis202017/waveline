import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:waveline/app/data/model/detail_record_model.dart';
import '../../global/constanta.dart';
import '../model/record.dart';

class RecordServices {
  Future<List<RecordModel>> record() async {
    GetStorage storage = GetStorage();
    try {
      Uri uri = Uri.parse('$baseUrl/get-record');
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${storage.read('token')}",
        },
      );
      if (response.statusCode == 200) {
        List? data =
            (json.decode(response.body) as Map<String, dynamic>)['record'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => RecordModel.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DetailRecordModel?> detailRecordModel({int? id}) async {
    GetStorage storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/get-record-detail/$id'),
        headers: {'Authorization': 'Bearer ${storage.read('token')}'},
      );
      print(json.decode(response.body)['record'][0]);
      if (response.statusCode == 200) {
        return DetailRecordModel.fromJson(
          json.decode(response.body)['record'][0],
        );
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }
}
