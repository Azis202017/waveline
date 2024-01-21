import 'package:get/get.dart';

import '../../../data/model/feedback.dart';
import '../../../data/services/feedback_service.dart';

class FeedbackController extends GetxController {
  bool isLoading = true;
  List<FeedbackModel> listOfFeedback = [];
  @override
  void onInit() {
    super.onInit();
    getListFeedback();
  }
  Future<void> getListFeedback() async {
    listOfFeedback = await FeedbackService().getListFeedback();
    print(listOfFeedback);
    isLoading = false;
    update();
  }



}
