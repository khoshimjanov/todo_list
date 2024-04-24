import 'package:flutter/material.dart';

import '../../../helpers/app_colors.dart';
import '../../../helpers/app_styles.dart';

class ConfirmButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ConfirmButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => onPressed(),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          decoration: BoxDecoration(
            color: AppColors.borderColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: AppStyles.whitebuttonTextStyle,
          )),
    );
  }
}
