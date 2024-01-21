import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:waveline/app/widgets/home/doctor_widget.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/color.dart';
import '../../../theme/font.dart';
import '../../../widgets/home/device_widget.dart';
import '../../../widgets/home/profile_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(
        builder: (_) {
          return controller.isLoading
              ? const Material(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  body: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 51,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileWidget(
                            name: controller.patient?.user?.name ?? "",
                            foto: "",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DeviceWidget(
                            onPressed: controller.bluetoothScan,
                            name: controller.selectedBluetoothDevice?.name,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          controller.history.isEmpty
                              ? Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/empty_ecg.png',
                                      height: 150,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'You have record first to doctor know you',
                                      textAlign: TextAlign.center,
                                      style: h3Bold,
                                    ),
                                  ],
                                )
                              : ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: controller.history.length,
                                  itemBuilder: (_, index) {
                                    var data = controller.history[index];
                                    return Container(
                                      margin: const EdgeInsets.only(
                                        top: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: ListTile(
                                        onTap: () {
                                          Get.toNamed(
                                            Routes.DETAIL_RECORD,
                                            arguments: {
                                              'id': data.id,
                                              'device' : controller.selectedBluetoothDevice,
                                            },
                                          );
                                        },
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Name Patient",
                                                style: bodyBold),
                                            Text('${data.patient?.user?.name}',
                                                style: body2Medium),
                                          ],
                                        ),
                                        trailing: Text(
                                          DateFormat.yMMMMd('en_US').format(
                                            data.createdAt ?? DateTime.now(),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                          const SizedBox(
                            height: 24,
                          ),
                          DoctorProfileWidget(
                            name: controller.patient?.doctor?.name ?? "",
                            onPressed: () {
                              Get.toNamed(Routes.RECORD, arguments: {
                                "device": controller.selectedBluetoothDevice,
                              });
                            },
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
