import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../data/model/prediction.dart';
import '../global/constanta.dart';

class PredictionService {
  Future<PredictModel?> makePrediction() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        machineLearningUrl,
      ),
    );

    // Add files to the request
    List<String> assetPaths = [
      'assets/predict/test.dat',
      'assets/predict/test.hea',
    ];

    for (var assetPath in assetPaths) {
      ByteData data = await rootBundle.load(assetPath);
      List<int> bytes = data.buffer.asUint8List();

      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          bytes,
          filename: assetPath.split('/').last,
        ),
      );
    }

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        // Parse the JSON response
        String responseBody = await response.stream.bytesToString();
        final predictModel = PredictModel.fromJson(json.decode(responseBody));
        
        return predictModel;
      } else {
        // Request failed
        print('Failed to upload files. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // An error occurred
      print('Error uploading files: $e');
      return null;
    }
  }

  Future<PredictModel?> strokePrediction() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        machineLearningUrl,
      ),
    );

    // Add files to the request
    List<String> assetPaths = [
      'assets/predict/228.dat',
      'assets/predict/228.hea',
    ];

    for (var assetPath in assetPaths) {
      ByteData data = await rootBundle.load(assetPath);
      List<int> bytes = data.buffer.asUint8List();

      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          bytes,
          filename: assetPath.split('/').last,
        ),
      );
    }

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        // Parse the JSON response
        String responseBody = await response.stream.bytesToString();
        final predictModel = PredictModel.fromJson(json.decode(responseBody));

        return predictModel;
      } else {
        // Request failed
        print('Failed to upload files. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // An error occurred
      print('Error uploading files: $e');
      return null;
    }
  }
}
