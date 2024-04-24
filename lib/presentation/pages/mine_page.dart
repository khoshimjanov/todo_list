import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/mine_page_widgets/category_diagram.dart';
import 'package:todo_list/presentation/widgets/mine_page_widgets/circular_diagram.dart';
import 'package:todo_list/presentation/widgets/mine_page_widgets/line_graph_widget.dart';
import 'package:todo_list/presentation/widgets/tasks_page_widgets/user_info.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(),
      backgroundColor: AppColors.mainBackgroundColor,
      body: Column(
        children: [
          const UserInfo(),
          Expanded(
            child: _body(context),
          ),
        ],
      ),
    );
  }

  Padding _body(BuildContext context) {
    final state = context.read<TasksCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView(),
            // ListView.builder(itemBuilder: (context, index) {
            //   return Column();
            // },),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularDiagram(
                        total: state.totalTasks(),
                        done: state.completedTasks(),
                      ),
                      Column(
                        children: [
                          Text(
                            '${state.totalTasks()}',
                            style: AppStyles.mainTitleTextStyle,
                          ),
                          const Text(
                            'Total Tasks',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: tasksInfo(
                      state.completedTasks(), state.uncompletedTasks()),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(0),
              child: LineGraphWidget(
                data: [
                  3,
                  4,
                  5,
                  6,
                  2,
                  5,
                  4,
                ],
                days: [
                  1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                ],
              ),
            ),
            const CategoryDiagram()
          ],
        ),
      ),
    );
  }

  Padding tasksInfo(int completedTasks, int uncompletedTasks) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  Assets.icons.more,
                  width: 22,
                ),
                const Text(
                  'Pending',
                  style: AppStyles.greybuttonTextStyle,
                ),
                Text(
                  uncompletedTasks.toString(),
                  style: AppStyles.titleNameTextStyle,
                ),
              ],
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                Assets.icons.completed,
                width: 22,
                // ignore: deprecated_member_use
                color: AppColors.borderColor,
              ),
              const Text(
                'Completed',
                style: AppStyles.greybuttonTextStyle,
              ),
              Text(
                completedTasks.toString(),
                style: AppStyles.titleNameTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
