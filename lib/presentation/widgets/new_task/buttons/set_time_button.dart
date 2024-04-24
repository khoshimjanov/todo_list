import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:todo_list/presentation/helpers/app_styles.dart';

import '../../../helpers/app_colors.dart';

class SetTimeButton extends StatelessWidget {
  final String title;
  final String icon;
  final String data;
  final Function action;
  const SetTimeButton({
    super.key,
    required this.title,
    required this.data,
    required this.icon,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => action(),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.mainBackgroundColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(icon),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                  ),
                ],
              ),
              Text(
                data,
                style: AppStyles.greybuttonTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
