import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../../../widget/common_dialog.dart';

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

  void onTapCancelWithdraw() {
    Get.back(result: true);
  }

  void onTapWithdraw() {
    Get.dialog(
      CommonDialog(
        content: 'withdraw_final_question'.tr.replaceAll('&&', 'sample'),
        positiveText: 'withdraw'.tr,
        onTapPositive: () {
          Get.offAllNamed(Routes.login);
        },
      ),
    );
  }

// Life Cycle ▼ ------------------------------------------------------
}
