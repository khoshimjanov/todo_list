import 'package:flutter/material.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';

import '../../../../helpers/app_colors.dart';

class ChooseTimeButton extends StatelessWidget {
  const ChooseTimeButton({
    required this.text,
    required this.action,
    required this.isSelected,
    super.key,
  });
  final String text;
  final Function action;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.all(4),
          ),
          backgroundColor:
              const MaterialStatePropertyAll(AppColors.mainBackgroundColor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(
                color: isSelected ? AppColors.borderColor : Colors.transparent,
              ),
            ),
          ),
        ),
        onPressed: () => action(),
        child: Text(
          text,
          style: isSelected
              ? AppStyles.timeButtonTextStyle
              : AppStyles.greyTimeButtonTextStyle,
        ),
      ),
    );
  }
}
