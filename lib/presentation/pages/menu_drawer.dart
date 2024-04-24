import 'package:flutter/material.dart';
import 'package:todo_list/l10n/l10n.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/drawer_items.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.mainBackgroundColor,
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: AppColors.mainBoxColor,
                boxShadow: [
                  BoxShadow(offset: Offset(0, 2), color: AppColors.borderColor),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Text(
                context.l10n!.appTitle,
                style: AppStyles.mainTitleTextStyle,
              ),
            ),
          ),
          const Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: DrawerItems(),
            ),
          ),
        ],
      ),
    );
  }
}
