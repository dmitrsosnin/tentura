import 'package:flutter/material.dart';

import '../bloc/settings_cubit.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<SettingsCubit, SettingsState, ThemeMode>(
        selector: (state) => state.themeMode,
        builder: (context, themeMode) => SegmentedButton<ThemeMode>(
          selected: <ThemeMode>{themeMode},
          showSelectedIcon: false,
          segments: const [
            ButtonSegment<ThemeMode>(
              icon: Icon(Icons.brightness_7),
              tooltip: 'Light',
              value: ThemeMode.light,
            ),
            ButtonSegment<ThemeMode>(
              icon: Icon(Icons.brightness_auto_outlined),
              tooltip: 'System',
              value: ThemeMode.system,
            ),
            ButtonSegment<ThemeMode>(
              icon: Icon(Icons.brightness_5),
              tooltip: 'Dark',
              value: ThemeMode.dark,
            ),
          ],
          onSelectionChanged: (selected) =>
              context.read<SettingsCubit>().setThemeMode(selected.single),
        ),
      );
}
