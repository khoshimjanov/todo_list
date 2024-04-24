// import 'package:flutter/material.dart';

// class AppRouter {
//   static Route<dynamic> router(RouteSettings settings) {
//     switch (settings.name) {
//       case AppRoutes.splash:
//         return fade(const SplashScreen());
//       case AppRoutes.home:
//         return fade(const HomeScreen());
//       case AppRoutes.onboarding:
//         return fade(const OnboardingScreen());
//       default:
//         return fade(const ErrorScreen());
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:todo_list/presentation/pages/drawer_pages/completed_tasks_page.dart';
import 'package:todo_list/presentation/pages/drawer_pages/faq_page.dart';
import 'package:todo_list/presentation/pages/drawer_pages/settings_page.dart';
import 'package:todo_list/presentation/pages/drawer_pages/setttings_pages/notification_page.dart';
import 'package:todo_list/presentation/pages/drawer_pages/star_tasks_page.dart';

Map<String, Widget Function(BuildContext)> routes() {
  return {
    StarTasksPage.pageName: (_) => const StarTasksPage(),
    CompletedTasksPage.pageName: (_) => const CompletedTasksPage(),
    SettingsPage.pageName: (_) => const SettingsPage(),
    FaqPage.pageName: (_) => const FaqPage(),
    NotificationPage.pageName: (_) => const NotificationPage(),
  };
}
