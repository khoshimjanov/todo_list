import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/user_cubit/user_cubit.dart';
import '../../helpers/app_colors.dart';

class NameChange extends StatelessWidget {
  const NameChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      height: 300,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => Navigator.of(context).pop(),
              child: Ink(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.mainBoxColor,
                  ),
                ),
                child: const Icon(
                  Icons.close,
                  // color: AppColors.maindarkTextColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: AppColors.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white54),
                      hintText: BlocProvider.of<UserCubit>(context).state.name,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<UserCubit>(context, listen: false)
                        .changeName(controller.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Add my name',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.borderColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
