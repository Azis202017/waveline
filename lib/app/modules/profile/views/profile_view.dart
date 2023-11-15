import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:waveline/app/routes/app_pages.dart';
import 'package:waveline/app/theme/color.dart';

import '../../../theme/font.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_) {
      return controller.isLoading
          ? const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 32,
                            ),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/img/bg.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Profile',
                                  style: h2Regular,
                                ),
                                SizedBox(
                                  width: 90,
                                  height: 90,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          color: secondaryColor3,
                                          borderRadius:
                                              BorderRadius.circular(90),
                                        ),
                                        child: Image.asset(
                                          'assets/img/21.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: SizedBox(
                                          width: 32,
                                          height: 32,
                                          child: CircleAvatar(
                                            child: Image.asset(
                                              'assets/img/edit_icon.png',
                                              color: whiteColor,
                                              width: 21,
                                              height: 21,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${controller.patient?.user?.name}',
                                  style: h4Bold),
                              Text('Patient', style: body2Regular)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GridView(
                          primary: false,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.6,
                            crossAxisCount: 2,
                            mainAxisSpacing: 12.0,
                            crossAxisSpacing: 12.0,
                          ),
                          children: [
                            ProfileCard(
                              color: backgroundColorNameCard,
                              image: 'user_profile',
                              title: 'Name',
                              subtitle: '${controller.patient?.user?.name}',
                            ),
                            const ProfileCard(
                              color: backgroundColorAge,
                              image: 'age_user',
                              title: 'Age',
                              subtitle: '25 Year',
                            ),
                            const ProfileCard(
                              color: backgroundGender,
                              image: 'gender_user',
                              title: 'Gender',
                              subtitle: 'Male',
                            ),
                            const ProfileCard(
                              color: backgroundWeight,
                              image: 'weight_user',
                              title: 'Weight',
                              subtitle: '50',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.LOGIN);
                              },
                              child: const Text('Logout')),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}

class ProfileCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Color color;
  const ProfileCard({
    super.key,
    required this.image,
    required this.title,
    required this.color,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/img/$image.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: body2Medium.copyWith(
              color: black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: h4Bold.copyWith(
              color: black,
            ),
          ),
        ],
      ),
    );
  }
}
