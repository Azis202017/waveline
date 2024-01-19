import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:waveline/app/modules/feedback/controllers/feedback_controller.dart';
import 'package:waveline/app/modules/profile/controllers/profile_controller.dart';
import 'package:waveline/app/theme/color.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(ProfileController());
    Get.put(FeedbackController());
    Get.put(BottomNavController(), permanent: true);

    return GetBuilder<BottomNavController>(builder: (context) {
      return Scaffold(
        body: Stack(
          children: [
            controller.page.elementAt(controller.selectedIndex),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 32,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 17, 51, 0.35),
                          spreadRadius: 5,
                          blurRadius: 200,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: BottomNavigationBar(
                      selectedFontSize: 0,
                      unselectedFontSize: 0,
                      backgroundColor: Colors.white,
                      items: <BottomNavigationBarItem>[
                        CustomBottomNavbarItem(
                          title: "",
                          iconData: "home-non",
                          activeIconData: "home-active",
                        ),
                        CustomBottomNavbarItem(
                          title: "",
                          iconData: "icon-non",
                          activeIconData: "icon-active",
                        ),
                        CustomBottomNavbarItem(
                          title: "",
                          iconData: "user-non",
                          activeIconData: "user-active",
                        ),
                      ],
                      currentIndex: controller.selectedIndex,
                      elevation: 0,
                      onTap: controller.onItemTapped,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class CustomBottomNavbarItem extends BottomNavigationBarItem {
  CustomBottomNavbarItem({
    required String title,
    required String iconData,
    required String activeIconData,
    String? tooltip,
  }) : super(
          label: title,
          icon: Image.asset(
            'assets/img/$iconData.png',
            width: 24,
            height: 24,
          ),
          activeIcon: Container(
            width: 39,
            height: 39,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Color.fromRGBO(81, 140, 255, 0.28),
                ),
              ],
              borderRadius: BorderRadius.circular(39),
              color: primary,
            ),
            child: Center(
              child: Image.asset(
                "assets/img/$activeIconData.png",
                width: 18.23,
                height: 17.4,
                color: whiteColor,
              ),
            ),
          ),
        );
}
