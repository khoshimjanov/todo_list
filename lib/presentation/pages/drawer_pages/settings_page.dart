import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/l10n/l10n.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/pages/drawer_pages/setttings_pages/notification_page.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/drawer_tasks_appbar.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/settings_page_widgets/dialogues/show_language_change_dialogue.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/settings_page_widgets/setting_items_list.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/settings_page_widgets/setttings_page_item.dart';

class SettingsPage extends HookWidget {
  static const pageName = 'SettingsPageeName';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isTrue = useState(false);
    final l10n = context.l10n!;
    return Scaffold(
      appBar: emptyAppBar(),
      backgroundColor: AppColors.mainBackgroundColor,
      body: Column(
        children: [
          CustomAppbar(
            title: l10n.settings,
            icon: Assets.icons.search,
            onIconPressed: () {},
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SetttingItemsList(
                      title: 'Customize',
                      children: [
                        SettingsPageItem(
                          icon: Assets.icons.person,
                          title: 'Account sync',
                          onTap: () {},
                        ),
                        SettingsPageItem(
                          icon: Assets.icons.star,
                          title: 'Notification & Reminder',
                          onTap: () => Navigator.of(context)
                              .pushNamed(NotificationPage.pageName),
                        ),
                        SettingsPageItem(
                          icon: Assets.icons.phone,
                          title: 'task completion tone',
                          onTap: () {},
                          trailingWidget: CupertinoSwitch(
                            value: isTrue.value,
                            onChanged: (value) {
                              isTrue.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    SetttingItemsList(
                      title: l10n.dateAndTime,
                      children: [
                        SettingsPageItem(
                          icon: Assets.icons.calendar,
                          title: 'First day of week',
                          onTap: () {},
                        ),
                        SettingsPageItem(
                          icon: Assets.icons.star,
                          title: 'Time Format',
                          onTap: () {},
                        ),
                        SettingsPageItem(
                          icon: Assets.icons.calendar,
                          title: 'Date Format',
                          onTap: () {},
                        ),
                        SettingsPageItem(
                          icon: Assets.icons.star,
                          title: 'Due Format',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const Gap(20),
                    SetttingItemsList(
                      title: l10n.language,
                      children: [
                        SettingsPageItem(
                          icon: Assets.icons.all,
                          title: 'Change Language',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const ShowChangeLanguageDialogue();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
