import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../helpers/app_styles.dart';

class SubTaskInput extends HookWidget {
  const SubTaskInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: Form(
            child: TextFormField(
              onChanged: (value) {},
              controller: controller,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'add SubTask',
                hintStyle: AppStyles.greybuttonTextStyle,
              ),
              style: AppStyles.greybuttonTextStyle,
            ),
          ),
        ),
        const Icon(Icons.add_box_outlined, color: Colors.grey),
      ],
    );
  }
}
