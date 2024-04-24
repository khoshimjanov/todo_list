import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/tasks_page_widgets/show_tasks/task_item.dart';

class ShowTasksList extends HookWidget {
  final String title;
  final List<TaskModel> tasks;
  const ShowTasksList({
    super.key,
    required this.tasks,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var isExpanded = useState(false);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: ExpansionTile(
        collapsedBackgroundColor: AppColors.mainBoxColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        onExpansionChanged: (value) {
          isExpanded.value = value;
        },
        backgroundColor: AppColors.mainBackgroundColor,
        trailing: SvgPicture.asset(
          isExpanded.value == false ? Assets.icons.open : Assets.icons.close,
        ),
        title: Text(
          title,
          style: AppStyles.titleNameTextStyle,
        ),
        children: tasks.isEmpty
            ? [
                const Padding(
                  padding: EdgeInsets.all(
                    8.0,
                  ),
                  child: Text(
                    'No tasks',
                    style: AppStyles.titleNameTextStyle,
                  ),
                )
              ]
            : List.generate(
                tasks.length,
                (index) {
                  return TaskItem(
                    task: tasks[index],
                  );
                },
              ),
      ),
    );
  }
}
