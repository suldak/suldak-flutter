import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suldak_suldak/widget/custom_cupertino_date_picker.dart';

class Step2Controller extends GetxController {
  static Step2Controller get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  Rx<bool> isMale = false.obs;
  Rx<bool> isFemale = false.obs;

  Rx<bool> isActive = false.obs;

  Rx<bool> isYearSelectorFocused = false.obs;

  Rx<int> selectedYear = 1995.obs;

  // Functions ▼ ------------------------------------------------------

  void onSelectMale() {
    isMale.value = true;
    isFemale.value = !isMale.value;

    isActive.value = isMale.value ^ isFemale.value;
  }

  void onSelectFemale() {
    isFemale.value = true;
    isMale.value = !isFemale.value;

    isActive.value = isMale.value ^ isFemale.value;
  }

  void onTapYearSelector() async {
    isYearSelectorFocused.value = true;

    await Get.bottomSheet(
      Container(
        color: Colors.white,
        height: 300,
        child: CustomCupertinoDatePicker(
          showMonth: false,
          showDay: false,
          itemExtent: 40,
          selectedDate: DateTime(selectedYear.value),
          onSelectedItemChanged: (date) {
            selectedYear.value = date.year;
          },
        ),
      ),
    );

    isYearSelectorFocused.value = false;
  }

// Life Cycle ▼ ------------------------------------------------------
}
