import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/domain/category_model/category_model.dart';
import 'dart:math' as math;

import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/mine_page_widgets/category_diagram_item.dart';

class CategoryDiagram extends StatelessWidget {
  const CategoryDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.read<TasksCubit>();
    List<Color> colors = [
      Colors.grey,
      Colors.green,
      Colors.red,
      Colors.purple,
      Colors.yellow,
      Colors.blue,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  painter: CircleDiagramPainter(
                    personalPercentage:
                        tasks.getCategoryPercentage(Category.personal),
                    nocategoryPercentage:
                        tasks.getCategoryPercentage(Category.nocategory),
                    workPercentage: tasks.getCategoryPercentage(Category.work),
                    birthdayPercentage:
                        tasks.getCategoryPercentage(Category.birthday),
                    dailyPercentage:
                        tasks.getCategoryPercentage(Category.daily),
                    wishlistPercentage:
                        tasks.getCategoryPercentage(Category.wishlist),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.height * 0.15,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '${tasks.totalTasks()}',
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
            child: Column(
              children: [
                ...List.generate(
                  6,
                  (i) => CategoryDiagramItem(
                      categoryName: Category.values[i].name,
                      color: colors[i],
                      total: tasks.getCategoryPercentage(Category.values[i])),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleDiagramPainter extends CustomPainter {
  int wishlistPercentage;
  int birthdayPercentage;
  int dailyPercentage;
  int nocategoryPercentage;
  int workPercentage;
  int personalPercentage;

  CircleDiagramPainter({
    required this.nocategoryPercentage,
    required this.birthdayPercentage,
    required this.dailyPercentage,
    required this.wishlistPercentage,
    required this.workPercentage,
    required this.personalPercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = radius * 0.2;
    const strokeColor = Colors.transparent;
    final strokePaint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final totalPercentage = nocategoryPercentage +
        workPercentage +
        personalPercentage +
        wishlistPercentage +
        birthdayPercentage +
        dailyPercentage;
    final greenAngle = 2 * math.pi * (wishlistPercentage / totalPercentage);
    final redAngle = 2 * math.pi * (workPercentage / totalPercentage);
    final blueAngle = 2 * math.pi * (dailyPercentage / totalPercentage);
    final yellowAngle = 2 * math.pi * (personalPercentage / totalPercentage);
    final greyAngle = 2 * math.pi * (nocategoryPercentage / totalPercentage);
    final purpleAngle = 2 * math.pi * (birthdayPercentage / totalPercentage);

    canvas.drawCircle(center, radius, strokePaint);
    canvas.drawCircle(center, radius - strokeWidth, strokePaint);

    final greenPaint = Paint()..color = Colors.green;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      greenAngle,
      true,
      greenPaint,
    );

    final redPaint = Paint()..color = Colors.red;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + greenAngle,
      redAngle,
      true,
      redPaint,
    );

    final bluePaint = Paint()..color = Colors.blue;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + greenAngle + redAngle,
      blueAngle,
      true,
      bluePaint,
    );
    final yellowPaint = Paint()..color = Colors.yellow;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + greenAngle + redAngle + blueAngle,
      yellowAngle,
      true,
      yellowPaint,
    );
    final purplePaint = Paint()..color = Colors.purple;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + greenAngle + redAngle + blueAngle + yellowAngle,
      purpleAngle,
      true,
      purplePaint,
    );
    final greyPaint = Paint()..color = Colors.grey;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 +
          greenAngle +
          redAngle +
          blueAngle +
          yellowAngle +
          purpleAngle,
      greyAngle,
      true,
      greyPaint,
    );

    final whitePaint = Paint()..color = AppColors.mainBackgroundColor;
    canvas.drawCircle(center, radius - strokeWidth, whitePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
