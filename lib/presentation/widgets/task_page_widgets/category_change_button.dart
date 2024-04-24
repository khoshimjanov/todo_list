import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:todo_list/application/task_cubit/task_cubit.dart';

import 'package:todo_list/domain/category_model/category_model.dart';

import 'package:todo_list/gen/assets.gen.dart';

class CategoryChangeButton extends StatelessWidget {
  final Category category;
  const CategoryChangeButton({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: InkWell(
        onTap: () => context.read<TaskCubit>().changeCategory(category),
        child: Row(
          children: [
            SvgPicture.asset(
              context.watch<TaskCubit>().state.category == category
                  ? Assets.icons.chosenCircle
                  : Assets.icons.emptyCircle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(category.value),
            )
          ],
        ),
      ),
    );
  }
}

// class SubTaskInput extends HookWidget {
//   const SubTaskInput({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController();
//     return Row(
//       children: [
//         Expanded(
//           child: Form(
//             child: TextFormField(
//               controller: controller,
//               textInputAction: TextInputAction.search,
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//                 hintText: 'add SubTask',
//                 hintStyle: AppStyles.greybuttonTextStyle,
//               ),
//               style: AppStyles.greybuttonTextStyle,
//             ),
//           ),
//         ),
//         const Icon(Icons.add_box_outlined, color: Colors.grey),
//       ],
//     );
//   }
// }
