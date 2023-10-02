import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:suldak_suldak/config/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboardController.dart';

class OnboardLastPage extends StatefulWidget {
  OnboardLastPage({Key? key}) : super(key: key);

  @override
  _OnboardLastPageState createState() => _OnboardLastPageState();
}

class _OnboardLastPageState extends State<OnboardLastPage> {
  late SharedPreferences prefs;
  final OnboardController onboardController = OnboardController();

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
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
            onboardController.onboardPage(context, "\n", "나의 술취향은 무엇일까요?\n ",
                "함께 분석해봐요!\n", "assets/svg/bird_illustrator.svg"),
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
                onboardController.navigateLogin();
                prefs.setString('onboard', "true");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(327, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "시작하기",
                style: TextStyle(
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
