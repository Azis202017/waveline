import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:waveline/app/data/model/detail_record_model.dart';
import 'package:waveline/app/data/services/record_services.dart';

class ChartData {
  final int x;
  final double y1;
  final double y2;
  final double y3;

  ChartData(this.x, this.y1, this.y2, this.y3);
}

class DetailRecordController extends GetxController {
  var id = Get.arguments['id'];
  BluetoothDevice bluetoothDevice = Get.arguments['device'];
  BluetoothConnection? connection;
  List<ChartData> chartData = [];

  late StreamController<List<ChartData>> _chartDataStreamController;

  Stream<List<ChartData>> get chartDataStream =>
      _chartDataStreamController.stream;

  Timer? chartUpdateTimer;
  DetailRecordModel? detailRecordModel;
  bool isLoading = false; // Updated to start with false

  @override
  void onInit() {
    super.onInit();
    _chartDataStreamController = StreamController<List<ChartData>>.broadcast();
    connect();
    detailRecord(); // Move the detailRecord call here to ensure it is called when the controller is initialized.
  }

  void detailRecord() async {
    try {
      isLoading = true;
      update();
      detailRecordModel = await RecordServices().detailRecordModel(id: id);
    } finally {
      isLoading = false;
      update();
    }
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
            int x = DateTime.now().millisecondsSinceEpoch;
            double y1 = double.tryParse(values[0]) ?? 0.0;
            double y2 = double.tryParse(values[1]) ?? 0.0;
            double y3 = double.tryParse(values[2]) ?? 0.0;

            ChartData newData = ChartData(x, y1, y2, y3);
            chartData.add(newData);

            if (chartUpdateTimer == null || !chartUpdateTimer!.isActive) {
              chartUpdateTimer = Timer(const Duration(seconds: 1), () {
                updateChart();
              });
            }
          }
        },
        onDone: () {
          print('Connection closed');
        },
        onError: (error) {
          print('Error: $error');
        },
      );
    } catch (error) {
      print('Error connecting to the device: $error');
    }
  }

  void updateChart() {
    _chartDataStreamController.add(chartData);
  }

  @override
  void onClose() {
    _chartDataStreamController.close();
    super.onClose();
  }
}
