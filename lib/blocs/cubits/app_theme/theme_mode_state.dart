// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'theme_mode_cubit.dart';

class ThemeModeState extends Equatable {
  final ThemeMode themeModeState;
  const ThemeModeState({
    required this.themeModeState,
  });
  // factory constructor for the initial state
  factory ThemeModeState.initial() {
    return const ThemeModeState(
      themeModeState: ThemeMode.light,
    );
  }
  ThemeModeState copyWith({
    ThemeMode? themeModeState,
  }) {
    return ThemeModeState(
      themeModeState: themeModeState ?? this.themeModeState,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [themeModeState];

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result.addAll({
      'themeModeState': themeModeState.name,
    });
    return result;
  }

  factory ThemeModeState.fromJson(Map<String, dynamic> json) {
    switch (json['themeModeState']) {
      case 'light':
        return const ThemeModeState(
          themeModeState: ThemeMode.light,
        );
      case 'dark':
        return const ThemeModeState(
          themeModeState: ThemeMode.dark,
        );
      default:
        return const ThemeModeState(
          themeModeState: ThemeMode.light,
        );
    }
  }
}
