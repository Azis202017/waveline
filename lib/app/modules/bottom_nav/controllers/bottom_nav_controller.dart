import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waveline/app/modules/feedback/views/feedback_view.dart';
import 'package:waveline/app/modules/home/views/home_view.dart';
import 'package:waveline/app/modules/profile/views/profile_view.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;

  List<Widget> page = [
    const HomeView(),
    const FeedbackView(),
    const ProfileView(),

  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
