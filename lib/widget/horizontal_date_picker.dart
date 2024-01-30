import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../config/colors.dart';

class HorizontalDatePicker extends StatefulWidget {
  const HorizontalDatePicker({super.key});

  @override
  State<HorizontalDatePicker> createState() => _HorizontalDatePickerState();
}

class _HorizontalDatePickerState extends State<HorizontalDatePicker> {
  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    selectedIndex = now.day - 1;
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
            final DateTime currentDate = lastDayOfMonth.add(Duration(days: index + 1));
            final String dayName = DateFormat('E').format(currentDate);
            return buildDay(index + now.day - 1, dayName);
          },
        ),
      ),
    );
  }

  Widget buildDay(int index, String dayName) {
    return GestureDetector(
      onTap: () => setState(() {
        selectedIndex = index;
      }),
      child: Container(
        width: 35,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 7),
        margin: const EdgeInsets.only(right: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? AppColors.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayName.substring(0, 1),
              style: TextStyle(
                fontSize: 12,
                color: selectedIndex == index
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "${index + 1}",
              style: TextStyle(
                fontSize: 16.0,
                color: selectedIndex == index
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