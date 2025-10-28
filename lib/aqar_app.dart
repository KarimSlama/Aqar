import 'package:aqar/3qar/buyer_app/profile/controller/theme/cubit/theme_cubit.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/routing/app_router.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:aqar/core/service_locator/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '3qar/buyer_app/profile/controller/theme/cubit/theme_state.dart';

class AqarApp extends StatelessWidget {
  final AppRouter appRouter;
  const AqarApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 914),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocProvider(
        create: (context) => getIt<ThemeCubit>(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: AqarString.appTitle,
              theme: state.themeData,
              // darkTheme: themeDark,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.system,
              onGenerateRoute: appRouter.generateRoute,
              initialRoute: Routes.splashScreen,
            );
          },
        ),
      ),
    );
  }
}
