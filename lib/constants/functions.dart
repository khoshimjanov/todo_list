import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';

String formatDate(DateTime dateTime) {
  return DateFormat('dd/MM/yy').format(dateTime);
}

String getCurrentTime(DateTime dateTime) {
  final String formattedTime = DateFormat('hh:mm a').format(dateTime);
  return formattedTime;
}

int shortenId(int originalId) {
  return originalId % 214748364;
}

bool isToday(DateTime date) {
  final now = DateTime.now();
  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    return true;
  }
  return false;
}

bool isNow(DateTime date) {
  final now = DateTime.now();
  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    return true;
  }
  return false;
}

bool isAfter(DateTime dateTime) {
  DateTime now = DateTime.now();
  return dateTime.isAfter(
    now,
  );
}

List<double> calculatePercentages(List<int> numbers) {
  int sum = numbers.reduce((value, element) => value + element);
  List<double> percentages =
      numbers.map((number) => (number / sum) * 100).toList();

  return percentages;
}

PreferredSize emptyAppBar() {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 0),
    child: Container(color: AppColors.mainBoxColor),
  );
}

BoxDecoration dialogueDecoration(){
  return BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.mainBoxColor,
          boxShadow: const [
            BoxShadow(
              color: AppColors.borderColor,
              offset: Offset(-0.5, -0.5),
            ),
          ],
        );
}