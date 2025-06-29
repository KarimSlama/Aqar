import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/routing/app_router.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:aqar/core/theme/theme.dart';
import 'package:flutter/material.dart';

class AqarApp extends StatelessWidget {
  final AppRouter appRouter;
  const AqarApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AqarString.appTitle,
      theme: AqarTheme.lightTheme,
      darkTheme: AqarTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.splashScreen,
    );
  }
}
