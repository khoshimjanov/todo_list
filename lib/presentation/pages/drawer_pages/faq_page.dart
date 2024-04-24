import 'package:flutter/material.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/drawer_tasks_appbar.dart';

class FaqPage extends StatelessWidget {
  static const pageName = 'FaqPageName';
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(),
      backgroundColor: AppColors.mainBackgroundColor,
      body:   Column(
        children: [
          CustomAppbar(title: 'FAQ',icon: Assets.icons.search,onIconPressed: () {
            
          },),
          Expanded(child: Center(child: Text("Faq Page"))),
        ],
      ),
    );
  }
}
