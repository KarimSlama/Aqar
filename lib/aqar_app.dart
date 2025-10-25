import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/routing/app_router.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:aqar/core/theme/dark_theme.dart';
import 'package:aqar/core/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AqarApp extends StatelessWidget {
  final AppRouter appRouter;
  const AqarApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 914),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(_, child) =>  MaterialApp(
        title: AqarString.appTitle,
        theme: themeLight,
        darkTheme: themeDark,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.splashScreen,
      ),
    );
  }
}
