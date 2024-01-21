// import 'dart:convert';
// import 'dart:typed_data';
// import 'dart:async';

// import 'package:get/get.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
// import 'package:waveline/app/services/prediction_service.dart';

// import '../../../data/model/prediction.dart';

// class ChartData {
//   final int x;
//   final double y1;
//   final double y2;
//   final double y3;

//   ChartData(this.x, this.y1, this.y2, this.y3);
// }

// class RecordController extends GetxController {
//   BluetoothDevice bluetoothDevice = Get.arguments['device'];
//   BluetoothConnection? connection;
//   PredictModel? predictionModel = PredictModel();
//   var isRecording = false;
//   var isPredict = true;
//   List<ChartData> chartData = [];

//   late StreamController<List<ChartData>> _chartDataStreamController;
//   Stream<List<ChartData>> get chartDataStream =>
//       _chartDataStreamController.stream;

//   Timer? chartUpdateTimer;

//   @override
//   void onInit() {
//     super.onInit();
//     _chartDataStreamController = StreamController<List<ChartData>>.broadcast();
//     connect();
//   }

//   void connect() async {
//     try {
//       connection = await BluetoothConnection.toAddress(
//         bluetoothDevice.address,
//       );

//       print('Connected to the device');

//       connection?.input?.listen(
//         (Uint8List data) {
//           String receivedString = utf8.decode(data);

//           List<String> values = receivedString.split('\t');
//           if (values.length == 3) {
//             int x = DateTime.now().millisecondsSinceEpoch;
//             double y1 = double.tryParse(values[0]) ?? 0.0;
//             double y2 = double.tryParse(values[1]) ?? 0.0;
//             double y3 = double.tryParse(values[2]) ?? 0.0;

//             ChartData newData = ChartData(x, y1, y2, y3);
//             chartData.add(newData);

//             if (chartUpdateTimer == null || !chartUpdateTimer!.isActive) {
//               chartUpdateTimer = Timer(const Duration(seconds: 1), () {
//                 updateChart();
//               });
//             }
//           }
//         },
//         onDone: () {
//           print('Connection closed');
//         },
//         onError: (error) {
//           print('Error: $error');
//         },
//       );
//     } catch (error) {
//       print('Error connecting to the device: $error');
//     }
//   }

//   void updateChart() {
//     _chartDataStreamController.add(chartData);
//   }

//   @override
//   void onClose() {
//     _chartDataStreamController.close();
//     super.onClose();
//   }
// Future<void> makePrediction() async {
//     predictionModel = await PredictionService().makePrediction();

//     isPredict = false;
//     update();
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import '../../../data/model/prediction.dart';
import '../../../services/prediction_service.dart';
import '../../detail_record/controllers/detail_record_controller.dart';

class RecordController extends GetxController {
  BluetoothDevice bluetoothDevice = Get.arguments['device'];
  BluetoothConnection? connection;
  PredictModel? predictionModel = PredictModel();
  var isRecording = false;
  var isPredict = true;
  List<ChartData> chartData = [];

  late StreamController<List<ChartData>> _chartDataStreamController;
  Stream<List<ChartData>> get chartDataStream =>
      _chartDataStreamController.stream;

  Timer? chartUpdateTimer;

  // New variable for indexing
  int currentIndex = 1;

  @override
  void onInit() {
    super.onInit();
    _chartDataStreamController = StreamController<List<ChartData>>.broadcast();
    connect();
  }

  void connect() async {
    try {
      connection = await BluetoothConnection.toAddress(
        bluetoothDevice.address,
      );

      print('Connected to the device');

      connection?.input?.listen(
        (Uint8List data) {
          String receivedString = utf8.decode(data);

          List<String> values = receivedString.split('\t');
          if (values.length == 3) {
            // Use currentIndex for the x value
            double y1 = _normalizeValue(double.tryParse(values[0]) ?? 0.0);
            double y2 = _normalizeValue(double.tryParse(values[1]) ?? 0.0);
            double y3 = _normalizeValue(double.tryParse(values[2]) ?? 0.0);

            ChartData newData = ChartData(currentIndex, y1, y2, y3);
            chartData.add(newData);

            // Increment currentIndex for next data
            currentIndex++;

            if (chartUpdateTimer == null || !chartUpdateTimer!.isActive) {
              chartUpdateTimer = Timer(const Duration(seconds: 1), () {
                updateChart();
              });
            }
          }
        },
      );
    } catch (e) {
      print('Cannot connect, exception occurred');
    }
  }

  void updateChart() {
    _chartDataStreamController.add(List.from(chartData));
  }

  double _normalizeValue(double value) {
    // You should calculate these based on your dataset
    double mean = 0; // Replace with actual mean
    double stdDev = 1; // Replace with actual standard deviation

    return (value - mean) / stdDev;
  }

  Future<void> makePrediction() async {
    predictionModel = await PredictionService().makePrediction();

    isPredict = false;
    update();
  }
}
