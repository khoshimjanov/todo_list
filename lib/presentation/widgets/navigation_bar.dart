import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/l10n/l10n.dart';
import '../helpers/app_colors.dart';

class MainNavigationBar extends StatelessWidget {
  final Function(int index) action;
  final int selectedIndex;
  const MainNavigationBar({
    super.key,
    required this.action,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n!;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Ink(
        // // padding: EdgeInsets.only(top: 0),
        // decoration: const BoxDecoration(
        //   color: AppColors.mainBoxColor,
        //   borderRadius: BorderRadius.all(Radius.circular(10)
        //       // topLeft: Radius.circular(10),
        //       // topRight: Radius.circular(10),
        //       ),
        //   // border: Border.all(
        //   // color: AppColors.borderColor,
        //   // ),
        //   boxShadow: [
        //     // BoxShadow(
        //     //   color: AppColors.borderColor,
        //     //   blurRadius: 0,
        //     //   offset: Offset(1, 1),
        //     // ),
        //     BoxShadow(
        //       color: AppColors.borderColor,
        //       // spreadRadius: 5,
        //       // blurRadius: 10,
        //       offset: Offset(0, -1),
        //     ),
        //     BoxShadow(
        //       color: AppColors.borderColor,
        //       blurRadius: 0,
        //       offset: Offset(0, -10),
        //     ),
        //   ],
        // ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.mainBoxColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[600],
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.mainBackgroundColor,
              tooltip: l10n.menu,
              label: l10n.menu,
              activeIcon: SvgPicture.asset(
                Assets.icons.selectedMenu,
              ),
              icon: SvgPicture.asset(Assets.icons.menu),
            ),
            BottomNavigationBarItem(
              tooltip: l10n.tasks,
              label: l10n.tasks,
              activeIcon: SvgPicture.asset(
                Assets.icons.selectedTasks,
              ),
              icon: SvgPicture.asset(
                Assets.icons.tasks,
              ),
            ),
            BottomNavigationBarItem(
              tooltip: l10n.calendar,
              label: l10n.calendar,
              activeIcon: SvgPicture.asset(
                Assets.icons.selectedCalendar,
              ),
              icon: SvgPicture.asset(Assets.icons.calendar),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.mainBackgroundColor,
              tooltip: l10n.mine,
              label: l10n.mine,
              activeIcon: SvgPicture.asset(
                Assets.icons.selectedMine,
              ),
              icon: SvgPicture.asset(Assets.icons.mine),
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (value) => action(value),
        ),
      ),
    );
  }
}
