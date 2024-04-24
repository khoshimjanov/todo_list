import 'package:flutter/material.dart';

import 'package:todo_list/infrastructure/db_helper.dart';
import 'package:todo_list/infrastructure/notifications/local_notification.dart';
import 'my_app.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await LocalNotifications.init();
  await DbHelper.initialize();
  await DbHelper.openBox();
  runApp(
    const MyApp(),
  );
}
