import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:todo_list/presentation/pages/calendar_page.dart';
import 'package:todo_list/presentation/pages/mine_page.dart';
import 'package:todo_list/presentation/pages/tasks_page.dart';
import '../helpers/app_colors.dart';
import '../widgets/navigation_bar.dart';
import 'menu_drawer.dart';

class MainPage extends HookWidget {
  const MainPage({super.key});
  final List<Widget> pages = const [
    SizedBox(),
    TasksPage(),
    CalendarPage(),
    MinePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final selectedIndex = useState(1);
    final pageController = PageController(initialPage: selectedIndex.value);

    return Scaffold(
      key: scaffoldKey,
      drawer: const MenuDrawer(),
      backgroundColor: AppColors.mainBackgroundColor,
      bottomNavigationBar: MainNavigationBar(
        action: (value) =>
            _onPageSelected(value, pageController, selectedIndex, scaffoldKey),
        selectedIndex: selectedIndex.value,
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) =>
            _onPageSelected(value, pageController, selectedIndex, scaffoldKey),
        children: pages,
      ),
    );
  }

  void _onPageSelected(int value, PageController pageController,
      ValueNotifier<int> selectedIndex, GlobalKey<ScaffoldState> scaffoldKey) {
    if (value == 0) {
      scaffoldKey.currentState!.openDrawer();
      return;
    }
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    selectedIndex.value = value;
  }
}
