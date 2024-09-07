import 'package:flutter/material.dart';

import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/settings_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  static Future<SettingsCubit> hydrated(SettingsRepository repository) async =>
      SettingsCubit(
        repository: repository,
        state: SettingsState(
          themeMode: await repository.getThemeMode(),
          introEnabled: await repository.getIsIntroEnabled(),
        ),
      );

  SettingsCubit({
    required SettingsRepository repository,
    SettingsState state = const SettingsState(),
  })  : _repository = repository,
        super(state);

  final SettingsRepository _repository;

  Future<void> setThemeMode(ThemeMode themeMode) async => emit(state.copyWith(
        themeMode: await _repository.setThemeMode(themeMode),
      ));

  Future<void> setIntroEnabled(bool isEnabled) async => emit(state.copyWith(
        introEnabled: await _repository.setIsIntroEnabled(isEnabled),
      ));
}
