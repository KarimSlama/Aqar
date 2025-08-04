import 'package:aqar/aqar_app.dart';
import 'package:aqar/core/local_storage/local_storage.dart';
import 'package:aqar/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/constants.dart';
import 'core/service_locator/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  await Supabase.initialize(
    url: "",
    anonKey: "",
  );

  await checkIfUserLoggedIn();

  runApp(AqarApp(appRouter: AppRouter()));
}

checkIfUserLoggedIn() async {
  final userKey = await SharedPreference.getSecureString(Constants.USER_KEY);
  if (userKey != null && userKey.isNotEmpty) {
    isLoggedUser = true;
  } else {
    isLoggedUser = false;
  }
}
