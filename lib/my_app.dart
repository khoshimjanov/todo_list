import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/locale_cubit/locale_cubit.dart';
import 'package:todo_list/application/task_cubit/task_cubit.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/application/user_cubit/user_cubit.dart';
import 'package:todo_list/l10n/l10n.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';

import 'presentation/pages/main_page.dart';
import 'routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(
          create: (context) => TaskCubit(),
        ),
        BlocProvider<TasksCubit>(
          create: (context) => TasksCubit(),
        ),
        BlocProvider(
          create: (context) => LocaleCubit(),
        ),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeData(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: context.watch<LocaleCubit>().state,
          supportedLocales: AppLocalizations.supportedLocales,
          routes: routes(),
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => MainPage(),
            );
          },
        );
      },
    );
  }
}

ThemeData themeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    primaryColorDark: AppColors.mainBackgroundColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodySmall: TextStyle(),
    ),
    primaryColorLight: Colors.white,
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: AppColors.mainBackgroundColor,
    ),
    primaryColor: AppColors.mainBackgroundColor,
  );
}
