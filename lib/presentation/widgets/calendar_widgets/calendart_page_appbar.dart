import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/application/user_cubit/user_cubit.dart';
import 'package:todo_list/domain/user_model/user_model.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';

import '../../../gen/assets.gen.dart';
import '../../helpers/app_colors.dart';

class CalendarAppBar extends StatelessWidget {
  final DateTime chosenDate;
  final bool isExpanded;
  final VoidCallback onBackward;
  final VoidCallback onForward;
  const CalendarAppBar({
    super.key,
    required this.chosenDate,
    required this.isExpanded,
    required this.onBackward,
    required this.onForward,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserModel>(
      builder: (context, userData) {
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
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
                leading: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    isExpanded
                        ? Assets.icons.expandBack
                        : Assets.icons.expandMore,
                  ),
                ),
                title: Text(
                  DateFormat('y').format(chosenDate),
                  style: AppStyles.titleNameTextStyle,
                ),
                subtitle: Text(
                  DateFormat('MMMM').format(chosenDate),
                  style: AppStyles.titleNameTextStyle,
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      CupertinoButton(
                        onPressed: () => onBackward(),
                        child: SvgPicture.asset(Assets.icons.expandLeft),
                      ),
                      CupertinoButton(
                        onPressed: () => onForward(),
                        child: SvgPicture.asset(Assets.icons.expandRight),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
