import 'package:get/get.dart';

import '../controllers/started_page_controller.dart';

class StartedPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartedPageController>(
      () => StartedPageController(),
    );
  }
}
