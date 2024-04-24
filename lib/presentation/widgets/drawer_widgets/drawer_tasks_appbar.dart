import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';

import '../../../gen/assets.gen.dart';
import '../../helpers/app_colors.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final String icon;
  final Function() onIconPressed;
  final VoidCallback? onExitPressed;
  const CustomAppbar(
      {super.key,
      required this.title,
      required this.icon,
      required this.onIconPressed,
      this.onExitPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.mainBoxColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.borderColor,
            blurRadius: 0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CupertinoButton(
          child: SvgPicture.asset(Assets.icons.arrowForward),
          onPressed: () {
            if (onExitPressed != null) {
              onExitPressed!();
              return;
            }
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          title,
          style: AppStyles.titleNameTextStyle,
        ),
        trailing: IconButton(
          onPressed: () => onIconPressed(),
          icon: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
