import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class BluetoothScanController extends GetxController {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String deviceInfo = "";
  bool isLoading = true;
  List<BluetoothDevice> devices = [];

  @override
  void onInit() {
    super.onInit();

    getDeviceInfo();

    // Mulai pemindaian hanya jika daftar perangkat masih kosong
    if (devices.isEmpty) {
      scanBluetoothDevices();
    }
  }

  Future<void> getDeviceInfo() async {
    try {
      AndroidDeviceInfo? androidInfo = await deviceInfoPlugin.androidInfo;
      deviceInfo = androidInfo.model;
      isLoading = false;
      update();
    } catch (e) {
      print("Gagal mendapatkan informasi perangkat: $e");
      deviceInfo = "Gagal mendapatkan informasi perangkat";
    }
  }

  Future<void> scanBluetoothDevices() async {
    try {
      FlutterBluetoothSerial.instance
          .startDiscovery()
          .listen((discoveryResult) {
        // Update the list of devices whenever a new device is discovered
        devices.add(discoveryResult.device);
        update();
      });
    } catch (e) {
      print("Failed to start Bluetooth discovery: $e");
    }
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      // Connect to the selected Bluetooth device
      BluetoothConnection connection =
          await BluetoothConnection.toAddress(device.address);

      // Close the connection (you can customize this based on your use case)
      await connection.finish();

      // Navigate back to the home page and pass the device address as a result
      Get.back(result: device);
    } catch (e) {
      print('Error connecting to the device: $e');
    }
  }
}
