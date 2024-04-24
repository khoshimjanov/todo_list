import 'package:flutter/material.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';

class NewTaskButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const NewTaskButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: AppColors.borderColor, width: 2)),
        ),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        backgroundColor:
            const MaterialStatePropertyAll(AppColors.mainBackgroundColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          title,
          style: AppStyles.whitebuttonTextStyle,
        ),
      ),
    );
  }
}
