import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/application/task_cubit/task_cubit.dart';
import 'package:todo_list/domain/category_model/category_model.dart';
import 'package:todo_list/gen/assets.gen.dart';

class CategoryButton extends StatelessWidget {
  final Category category;
  const CategoryButton({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: SvgPicture.asset(
            context.watch<TaskCubit>().state.category == category
                ? Assets.icons.chosenCircle
                : Assets.icons.emptyCircle,
          ),
          onTap: () {
            context.read<TaskCubit>().changeCategory(
                  category,
                  
                );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Text(
            category.value,
          ),
        )
      ],
    );
  }
}
