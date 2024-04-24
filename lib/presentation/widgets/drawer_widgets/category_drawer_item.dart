import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String icon;
  final Function() onTap;
  final String? number;
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => onTap(),
      child: ListTile(
        leading: SvgPicture.asset(icon, width: 20),
        title: Text(title, style: AppStyles.titleNameTextStyle),
        trailing: number != null
            ? Text(
                number!,
                style: AppStyles.greybuttonTextStyle,
              )
            : null,
      ),
    );
  }
}
