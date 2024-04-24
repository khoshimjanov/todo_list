import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';

class SearchAppBar extends StatelessWidget {
  final Function(String value) onValueChange;
  final Function() onSearchPressed;
  final Function() onSearchExit;
  const SearchAppBar({
    super.key,
    required this.onValueChange,
    required this.onSearchPressed,
    required this.onSearchExit,
  });

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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              autocorrect: false,
              onChanged: (value) => onValueChange(value),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                icon: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  ),
                  onPressed: () => onSearchExit(),
                ),
                hintText: 'Search',
                hintStyle: AppStyles.titleNameTextStyle,
                border: InputBorder.none,
              ),
              style: AppStyles.titleNameTextStyle,
            ),
          ),
          CupertinoButton(
            onPressed: () => onSearchPressed(),
            child: SvgPicture.asset(Assets.icons.search),
          ),
        ],
      ),
    );
  }
}
