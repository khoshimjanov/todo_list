import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';

class TaskInfoItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final Function() onTap;
  const TaskInfoItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.mainBoxColor),
          child: ListTile(
            leading: SvgPicture.asset(
              icon,
              width: 25,
            ),
            title: Text(
              maxLines: 1,
              title,
              style: AppStyles.greyTitleTextStyle,
            ),
            subtitle: Text(
              subtitle,
              style: AppStyles.simpleTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
