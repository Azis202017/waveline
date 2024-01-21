import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:waveline/app/theme/color.dart';
import 'package:waveline/app/theme/font.dart';

import '../../detail_record/controllers/detail_record_controller.dart';
import '../controllers/record_controller.dart';

class RecordView extends GetView<RecordController> {
  const RecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecordController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Record Chart'),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: StreamBuilder<List<ChartData>>(
                    stream: controller.chartDataStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<ChartData> chartData = snapshot.data!;
                        return SizedBox(
                          width: double.infinity,
                          child: SfCartesianChart(
                            trackballBehavior: TrackballBehavior(
                              enable: true,
                              activationMode: ActivationMode.longPress,
                            ),
                            legend: const Legend(
                              isVisible: true,
                              isResponsive: true,
                            ),
                            zoomPanBehavior: ZoomPanBehavior(
                              enableDoubleTapZooming: true,
                              enablePanning: true,
                              enablePinching: true,
                            ),
                            series: <ChartSeries>[
                              SplineSeries<ChartData, int>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y1,
                                name: 'Signal 1',
                                color: Colors.green,
                              ),
                              SplineSeries<ChartData, int>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y2,
                                name: 'Signal 2',
                                color: Colors.red,
                              ),
                              SplineSeries<ChartData, int>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y3,
                                name: 'Signal 3',
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            Get.dialog(
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                            await controller.makePrediction();
                            Get.back();
                          },
                          child: const Text('Prediction'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                controller.predictionModel?.finalDecisions != null
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Result Prediction', style: body2Bold),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: whiteColor),
                              child: Text(
                                '${controller.predictionModel?.finalDecisions?[0]}',
                                style: h3SemiBold,
                              ),
                            ),
                          ],
                        ))
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                controller.predictionModel?.categoryResultsList != null
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Category List Result', style: body2Bold))
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                controller.predictionModel?.categoryResultsList != null
                    ? GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              2, // Adjust this value for the number of items per row
                          crossAxisSpacing:
                              2, // Spacing between items on the cross axis
                          mainAxisSpacing:
                              2, // Spacing between items on the main axis
                          childAspectRatio:
                              3 / 2, // Adjust to increase the width of cards
                        ),

                        itemCount: controller
                            .predictionModel
                            ?.categoryResultsList
                            ?.length, // Replace with the actual item count
                        itemBuilder: (context, index) {
                          List<dynamic>? data = controller
                              .predictionModel?.categoryResultsList?[index];
                          double percentage = data?[1] ?? 0.0;
                          return Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      16,
                                    ),
                                    color: whiteColor,
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${data?[0]}", style: h5Bold),
                                      Text(
                                        '${percentage.toStringAsFixed(2)}%',
                                        style: body2Medium,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      16,
                                    ),
                                    color: Colors.blue.shade200,
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Total ${data?[0]}',
                                        style: buttonLinkXSBold.copyWith(
                                          color: whiteColor,
                                        ),
                                      ),
                                      Text(
                                        '${data?[2]}',
                                        style: bodyBold.copyWith(
                                            color: whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
