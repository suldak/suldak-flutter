import 'package:get/get.dart';

enum WithdrawReason {
  noDesiredSearchResult,
  noDesiredStoryGroup,
  noDesiredRegionGroup,
  unpleasantUser,
  uncomfortableService,
  noDesiredFunction,
  notSatisfiedService,
}

class WithdrawSurveyController extends GetxController {
  static WithdrawSurveyController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  Rxn<WithdrawReason> currentSelection = Rxn<WithdrawReason>();

  // Functions ▼ ------------------------------------------------------

  void onRadioValueChanged(WithdrawReason? value) {
    currentSelection.value = value;
  }

  // Life Cycle ▼ ------------------------------------------------------
}