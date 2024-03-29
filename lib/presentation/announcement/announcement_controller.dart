import 'package:get/get.dart';

class AnnouncementController extends GetxController {

// Variable ▼ ------------------------------------------------------
  RxSet<int> selectedIndexes = RxSet<int>();

// Functions ▼ ------------------------------------------------------
  String getStatusForIndex(int index) {
    return selectedIndexes.contains(index)
        ? 'assets/svg/arrow_up.svg'
        : 'assets/svg/arrow_down.svg';
  }

  bool showDetail(int index) {
    return selectedIndexes.contains(index);
  }

  void toggleImage(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else {
      selectedIndexes.add(index);
    }
  }

// Life Cycle ▼ ------------------------------------------------------
}