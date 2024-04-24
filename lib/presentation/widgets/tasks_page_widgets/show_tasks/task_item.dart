import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/pages/task_page/task_page.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TaskPage(
            taskItem: task,
          ),
        ),
      ),
      child: Card(
        color: AppColors.mainBoxColor,
        child: Row(children: [
          Expanded(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.icons.more,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Text(
                    task.taskName,
                    style: AppStyles.titleNameTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDate(task.time),
                  style: AppStyles.greyTimeButtonTextStyle,
                ),
                task.isCompleted
                    ? SvgPicture.asset(
                        Assets.icons.bookmark,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_box_outlined,
                      color: Colors.grey, size: 20),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
