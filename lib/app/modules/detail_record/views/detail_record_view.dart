import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:waveline/app/theme/font.dart';

import '../../../theme/color.dart';
import '../controllers/detail_record_controller.dart';

class DetailRecordView extends GetView<DetailRecordController> {
  const DetailRecordView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailRecordController>(builder: (context) {
      return controller.isLoading
          ? const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                title: Text(
                    'Detail Patient ${controller.detailRecordModel?.patient?.user?.name}'),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                    yValueMapper: (ChartData data, _) =>
                                        data.y1,
                                    name: 'Signal 1',
                                    color: Colors.green,
                                  ),
                                  SplineSeries<ChartData, int>(
                                    dataSource: chartData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) =>
                                        data.y2,
                                    name: 'Signal 2',
                                    color: Colors.red,
                                  ),
                                  SplineSeries<ChartData, int>(
                                    dataSource: chartData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) =>
                                        data.y3,
                                    name: 'Signal 3',
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    Container(
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
                              '${controller.detailRecordModel?.result?.finalDecision}',
                              style: h3SemiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: whiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.detailRecordModel?.feedback?.text != null
                                ? "Feedback"
                                : '',
                            style: bodyBold,
                          ),
                          Text(
                            controller.detailRecordModel?.feedback?.text ?? "",
                            style: body2Regular,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(48),
                                  color: primary,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(42),
                                    child: Image.asset(
                                      'assets/img/doctor2.png',
                                      width: 42,
                                      height: 42,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.detailRecordModel?.patient
                                            ?.doctor?.name ??
                                        "",
                                    style: h4Bold,
                                  ),
                                  Text(
                                    'Cardiologist',
                                    style: buttonLinkXSBold.copyWith(
                                      color: fontAbu,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Text('Result Category', style: body2Bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GridView(
                      primary: false,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 2,
                      ),
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("PV", style: h3Bold),
                              Text(
                                '${controller.detailRecordModel?.result?.pv?.toStringAsFixed(2)}%',
                                style: body2Medium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Normal", style: h3Bold),
                              Text(
                                '${controller.detailRecordModel?.result?.normal?.toStringAsFixed(2)}%',
                                style: body2Medium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("VE", style: h3Bold),
                              Text(
                                '${controller.detailRecordModel?.result?.ve?.toStringAsFixed(2)}%',
                                style: body2Medium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("SVE", style: h3Bold),
                              Text(
                                '${controller.detailRecordModel?.result?.sve?.toStringAsFixed(2)}%',
                                style: body2Medium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Text('Result Class Category', style: body2Bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GridView(
                      primary: false,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 2,
                      ),
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("V", style: h3Bold),
                              Text(
                                '${controller.detailRecordModel?.result?.v?.toStringAsFixed(2)}%',
                                style: body2Medium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("A", style: h3Bold),
                              Text(
                                '${controller.detailRecordModel?.result?.a?.toStringAsFixed(2)}%',
                                style: body2Medium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("L", style: h3Bold),
                              Text(
                                '${controller.detailRecordModel?.result?.l?.toStringAsFixed(2)}%',
                                style: body2Medium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("R", style: h3Bold),
                              Text(
                                '${controller.detailRecordModel?.result?.r?.toStringAsFixed(2)}%',
                                style: body2Medium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("E", style: h3Bold),
                              Text(
                                '${controller.detailRecordModel?.result?.e?.toStringAsFixed(2)}%',
                                style: body2Medium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("F", style: h3Bold),
                              Text(
                                '${controller.detailRecordModel?.result?.f?.toStringAsFixed(2)}%',
                                style: body2Medium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: whiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("N", style: h3Bold),
                              Text(
                                '${controller.detailRecordModel?.result?.n?.toStringAsFixed(2)}%',
                                style: body2Medium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
    });
  }
}
