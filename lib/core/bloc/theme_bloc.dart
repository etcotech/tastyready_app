import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// Theme States
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Theme Events
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ToggleThemeEvent extends ThemeEvent {}

// Theme States
abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class LightThemeState extends ThemeState {}

class DarkThemeState extends ThemeState {}

// Theme Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    _loadTheme();
    on<ToggleThemeEvent>((event, emit) async {
      if (state is LightThemeState) {
        emit(DarkThemeState());
        await _saveTheme(false);
      } else {
        emit(LightThemeState());
        await _saveTheme(true);
      }
    });
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isLightTheme = prefs.getBool('isLightTheme') ?? true;
    if (isLightTheme) {
      emit(LightThemeState());
    } else {
      emit(DarkThemeState());
    }
  }

  Future<void> _saveTheme(bool isLightTheme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLightTheme', isLightTheme);
  }
}


