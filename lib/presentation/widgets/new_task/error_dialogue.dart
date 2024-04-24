

import 'package:flutter/material.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.mainBoxColor,
        content: Text(
          errorMessage,
          style: AppStyles.titleNameTextStyle,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
              style: AppStyles.simpleTextStyle,
            ),
          ),
        ],
      );
    },
  );
}
