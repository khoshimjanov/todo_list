import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:todo_list/application/locale_cubit/locale_cubit.dart';
import 'package:todo_list/domain/language_model/language_model.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/settings_page_widgets/buttons/language_change_button.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/confirm_button.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/task_button.dart';

class ShowChangeLanguageDialogue extends HookWidget {
  const ShowChangeLanguageDialogue({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final languageCode = context.watch<LocaleCubit>().state.languageCode;
    var currentLanguage = useState(languageCode);
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: AppColors.mainBoxColor,
      contentPadding: const EdgeInsets.all(0.2),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainBoxColor,
          boxShadow: const [
            BoxShadow(
              color: AppColors.borderColor,
              offset: Offset(-0.5, -0.5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Set category",
                  style: AppStyles.titleNameTextStyle,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  LanguageChangeButton(
                    language: Language.uzbek,
                    onPressed: () {
                      currentLanguage.value = Language.uzbek.value;
                    },
                    isChosen: currentLanguage.value == Language.uzbek.value,
                  ),
                  LanguageChangeButton(
                    language: Language.russian,
                    onPressed: () {
                      currentLanguage.value = Language.russian.value;
                    },
                    isChosen: currentLanguage.value == Language.russian.value,
                  ),
                  LanguageChangeButton(
                    language: Language.english,
                    onPressed: () {
                      currentLanguage.value = Language.english.value;
                    },
                    isChosen: currentLanguage.value == Language.english.value,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NewTaskButton(
                    title: 'Cancel',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Gap(10),
                  ConfirmButton(
                    title: 'Set',
                    onPressed: () {
                      context
                          .read<LocaleCubit>()
                          .changeLanguage(currentLanguage.value);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
