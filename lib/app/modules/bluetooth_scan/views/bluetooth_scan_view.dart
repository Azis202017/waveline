import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:waveline/app/theme/font.dart';

import '../../../theme/color.dart';
import '../controllers/bluetooth_scan_controller.dart';

class BluetoothScanView extends GetView<BluetoothScanController> {
  const BluetoothScanView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<BluetoothScanController>(builder: (_) {
        return controller.isLoading
            ? const Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  leadingWidth: 56,
                ),
                body: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 56,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Lottie.asset(
                            'assets/json/bluetooth_loading.json',
                            width: 250,
                            height: 250,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Text(
                            'Searching for devices ...',
                            style: h3Bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Text(
                            'Make sure your ${controller.deviceInfo} is unlocked and its Bluetooth is enabled',
                            style: body2Regular.copyWith(
                              color: fontAbu,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (controller.devices.isNotEmpty)
                          Column(
                            children: [
                              Text(
                                'Discovered Devices:',
                                style: h3Bold,
                              ),
                              const SizedBox(height: 8),
                              ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: controller.devices.length,
                                itemBuilder: (context, index) {
                                  final device = controller.devices[index];
                                  return ListTile(
                                    title: Text(device.name ?? ""),
                                    subtitle: Text(device.address),
                                    onTap: () {
                                      // Ketika perangkat dipilih, panggil metode connectToDevice
                                      controller.connectToDevice(device);
                                    },
                                    // Add onTap handler or other customization as needed
                                  );
                                },
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
