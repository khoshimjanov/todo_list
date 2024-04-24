import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';

class SettingsPageItem extends StatelessWidget {
  final String title;
  final String icon;
  final Function() onTap;
  final Widget? trailingWidget;
  const SettingsPageItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.trailingWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 3,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      onTap: () => onTap(),
      title: Text(
        title,
        style: AppStyles.simpleTextStyle,
      ),
      leading: SvgPicture.asset(
        icon,
        width: 20,
      ),
      trailing: trailingWidget,
    );
  }
}
