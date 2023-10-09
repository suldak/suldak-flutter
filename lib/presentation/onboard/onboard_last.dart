import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:suldak_suldak/config/colors.dart';
import 'package:get_storage/get_storage.dart';

import 'onboardController.dart';

class OnboardLastPage extends StatefulWidget {
  OnboardLastPage({Key? key}) : super(key: key);

  @override
  _OnboardLastPageState createState() => _OnboardLastPageState();
}

class _OnboardLastPageState extends State<OnboardLastPage> {
  final storage = GetStorage();
  final OnboardController onboardController = OnboardController();

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(18.0),
        height: double.infinity,
        child: IntroductionScreen(
          pages: [
            // page 4
            onboardController.onboardPage(context, 'onboard_last1', 'onboard_last2',
                'onboard_last3', 'assets/svg/bird_illustrator.svg'),
          ],
          showDoneButton: false,
          showNextButton: false,
          isProgress: false,
          globalFooter: Container(
            // 시작하기 버튼
            padding: const EdgeInsets.only(bottom: 34),
            height: 90,
            child: ElevatedButton(
              onPressed: () {
                onboardController.saveBoolData('onboard', true);
                onboardController.navigateLogin();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(327, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'start'.tr,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
