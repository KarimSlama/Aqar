import 'package:aqar/3qar/buyer_app/profile/controller/theme/cubit/theme_state.dart';
import 'package:aqar/core/local_storage/local_storage.dart';
import 'package:aqar/core/theme/light_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/dark_theme.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState(themeLight)) {
    getCurrentTheme();
  }

  void getCurrentTheme() async{
    final isDark = await SharedPreference.getBool('isDark') ?? false;

    if (isDark) {
      emit(DarkThemeState(themeDark));
    } else {
      emit(LightThemeState(themeLight));
    }
  }

  void toggleTheme() async{
    final currentIsDark = state.isDark;
    final newIsDark = !currentIsDark;

    await SharedPreference.setData('isDark', newIsDark);

    if (newIsDark) {
      emit(DarkThemeState(themeDark));
    } else {
      emit(LightThemeState(themeLight));
    }
  }
}
