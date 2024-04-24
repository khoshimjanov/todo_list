import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/user_cubit/user_cubit.dart';
import 'package:todo_list/domain/user_model/user_model.dart';
import 'package:todo_list/l10n/l10n.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import '../../helpers/app_colors.dart';

class UserInfo extends StatelessWidget {
  final Widget? trailingWidget;
  const UserInfo({
    super.key,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n!;
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ),
              title: Text(
                '${l10n.welcome} ${userData.name}',
                style: AppStyles.simpleTextStyle,
              ),
              subtitle: const Text(
                "Keep plan for 1 day",
                style: AppStyles.titleNameTextStyle,
              ),
              trailing: trailingWidget),
        );
      },
    );
  }
}
