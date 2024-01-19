import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:waveline/app/data/model/feedback.dart';

import '../../global/constanta.dart';

class FeedbackService {
  Future<List<FeedbackModel>> getListFeedback() async {
    GetStorage storage = GetStorage();
    try {
      Uri uri = Uri.parse('$baseUrl/get-feedback');
      http.Response response = await http.get(uri,
          headers: {'Authorization': 'Bearer ${storage.read('token')}'});
      if (response.statusCode == 200) {
        List? data =
            (json.decode(response.body) as Map<String, dynamic>)['feedback'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => FeedbackModel.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
