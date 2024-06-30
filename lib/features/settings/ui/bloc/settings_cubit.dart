import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:tentura/ui/bloc/state_base.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  @override
  SettingsState? fromJson(Map<String, dynamic> json) => SettingsState(
        introEnabled: json['introEnabled'] as bool? ?? true,
        themeMode: ThemeMode.values.firstWhere(
          (themeMode) => themeMode.name == json['themeMode'],
          orElse: () => ThemeMode.system,
        ),
      );

  @override
  Map<String, dynamic>? toJson(SettingsState state) =>
      state.themeMode == this.state.themeMode &&
              state.introEnabled == this.state.introEnabled
          ? null
          : {
              'introEnabled': state.introEnabled,
              'themeMode': state.themeMode.name,
            };

  void setThemeMode(ThemeMode themeMode) => emit(state.copyWith(
        themeMode: themeMode,
      ));

  void setIntroEnabled(bool isEnabled) => emit(state.copyWith(
        introEnabled: isEnabled,
      ));
}
