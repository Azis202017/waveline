import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:waveline/app/data/model/patient.dart';
import 'package:waveline/app/data/model/record.dart' as record;
import 'package:waveline/app/data/services/patient_service.dart';
import 'package:waveline/app/data/services/record_services.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  Patient? patient = Patient();
  BluetoothDevice? selectedBluetoothDevice;
  String? bluetoothDeviceName;
  List<record.RecordModel> history = [];

  @override
  void onInit() {
    super.onInit();
    getPatientData();
    getListOfRecord();
  }

  void getPatientData() async {
    patient = await PatientService().listOfPatient();
    isLoading = false;
    update();
  }

  void bluetoothScan() async {
    var status = await Permission.bluetooth.request();
    if (status.isGranted) {
      BluetoothDevice result = await Get.toNamed(Routes.BLUETOOTH_SCAN);

      selectedBluetoothDevice = result;
      bluetoothDeviceName = selectedBluetoothDevice!.name;
    
      update();
    } else {
      print('Bluetooth permissions not granted');
    }
  }
  Future<void> getListOfRecord() async {
    history = await RecordServices().record();
    update();
  }
}
