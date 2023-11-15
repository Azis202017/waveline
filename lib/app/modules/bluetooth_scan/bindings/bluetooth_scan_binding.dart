import 'package:get/get.dart';

import '../controllers/bluetooth_scan_controller.dart';

class BluetoothScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BluetoothScanController>(
      () => BluetoothScanController(),
    );
  }
}
