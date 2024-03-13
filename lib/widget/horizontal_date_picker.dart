import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../config/colors.dart';

class HorizontalDatePicker extends StatefulWidget {
  const HorizontalDatePicker({
    super.key,
    required this.callback,
  });

  final Function(DateTime selectedDate) callback;

  @override
  State<HorizontalDatePicker> createState() => _HorizontalDatePickerState();
}

class _HorizontalDatePickerState extends State<HorizontalDatePicker> {
  late DateTime selectedDate;
  DateTime now = DateTime.now();

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    selectedDate = now;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
          7,
          (index) {
            final DateTime currentDate = now.add(Duration(days: index));
            final String dayName = index == 0
                ? 'today'.tr
                : DateFormat(
                    'E',
                    Get.deviceLocale?.languageCode,
                  ).format(currentDate).substring(0, 1);
            return buildDay(currentDate, dayName);
          },
        ),
      ),
    );
  }

  Widget buildDay(DateTime currentDate, String dayName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = currentDate;
        });
        widget.callback(currentDate);
      },
      child: Container(
        width: 35,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 7),
        margin: const EdgeInsets.only(right: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedDate.difference(currentDate).inDays == 0
              ? AppColors.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayName,
              style: TextStyle(
                fontSize: 12,
                color: selectedDate.difference(currentDate).inDays == 0
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "${currentDate.day}",
              style: TextStyle(
                fontSize: 16.0,
                color: selectedDate.difference(currentDate).inDays == 0
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}