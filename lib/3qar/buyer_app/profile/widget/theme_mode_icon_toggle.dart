import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_string.dart';
import '../controller/theme/cubit/theme_cubit.dart';
import '../controller/theme/cubit/theme_state.dart';

class ThemeModeIconToggle extends StatelessWidget {
  const ThemeModeIconToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return SettingsMenuTile(
          icon: state.isDark ? Iconsax.moon : Iconsax.sun_1_copy,
          title: AqarString.appTheme,
          trailing: Switch(
            value: state.isDark,
            onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
            activeThumbColor: AqarColors.white,
            activeTrackColor: AqarColors.olive,
            trackOutlineColor: WidgetStateProperty.resolveWith(
              (final Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return null;
                }
                return Colors.transparent;
              },
            ),
          ),
        );
      },
    );
  }
}
