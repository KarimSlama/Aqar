import 'package:aqar/aqar_app.dart';
import 'package:aqar/core/local_storage/local_storage.dart';
import 'package:aqar/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/constants.dart';
import 'core/service_locator/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  
  setupServiceLocator();

  await Supabase.initialize(
    url: "https://ktbufzscykarhvrrlwzi.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt0YnVmenNjeWthcmh2cnJsd3ppIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MTEyMDUyOSwiZXhwIjoyMDY2Njk2NTI5fQ.TveB4Ujdr791EGkwwiWGjBpgO0ouVJaAKodQ9MQhKaw",
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
