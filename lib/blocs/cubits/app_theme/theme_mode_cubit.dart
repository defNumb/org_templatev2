import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends HydratedCubit<ThemeModeState> {
  ThemeModeCubit() : super(ThemeModeState.initial());

  // switch method to change the theme
  void switchTheme() {
    // if the current theme is light, switch to dark
    if (state.themeModeState == ThemeMode.light) {
      emit(state.copyWith(themeModeState: ThemeMode.dark));
    } else {
      // if the current theme is dark, switch to light
      emit(state.copyWith(themeModeState: ThemeMode.light));
    }
  }

  @override
  ThemeModeState? fromJson(Map<String, dynamic> json) {
    return ThemeModeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeModeState state) {
    return state.toJson();
  }
}
