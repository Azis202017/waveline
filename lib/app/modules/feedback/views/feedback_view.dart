import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:waveline/app/data/model/feedback.dart';
import 'package:waveline/app/theme/color.dart';
import 'package:waveline/app/theme/font.dart';

import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<FeedbackController>(builder: (_) {
        return controller.isLoading
            ? const Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  title: const Text('Feedback Doctor'),
                  centerTitle: true,
                ),
                body: ListView.builder(
                  itemCount: controller.listOfFeedback.length,
                  itemBuilder: (_, index) {
                    FeedbackModel data = controller.listOfFeedback[index];

                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 32,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 32,
                      ),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.text ?? "",
                            style: bodyRegular,
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
                                    data.record?.patient?.doctor?.name ?? "",
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
                    );
                  },
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    controller.getListFeedback();
                  },
                ),
              );
      }),
    );
  }
}
