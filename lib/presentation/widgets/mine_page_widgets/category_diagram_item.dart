import 'package:flutter/material.dart';

import 'package:todo_list/presentation/helpers/app_styles.dart';

class CategoryDiagramItem extends StatelessWidget {
  final Color color;
  final String categoryName;
  final int total;
  const CategoryDiagramItem({
    super.key,
    required this.categoryName,
    required this.color,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3), 
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
            height: 10,
            width: 10,
          ),
          const SizedBox(width: 8),
          Text(
            categoryName,
            style: AppStyles.greybuttonTextStyle,
          ),
          const Spacer(), 
          Text(
            total.toString(),
            style: AppStyles.simpleTextStyle,
          ),
        ],
      ),
    );

     
  }
}
