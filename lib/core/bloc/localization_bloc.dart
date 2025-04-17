import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tastyready_mobile/core/utils/app_localizations.dart';

// Events
abstract class LocalizationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLocalization extends LocalizationEvent {}

class ChangeLanguage extends LocalizationEvent {
  final String languageCode;

  ChangeLanguage(this.languageCode);

  @override
  List<Object?> get props => [languageCode];
}

// States
abstract class LocalizationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocalizationInitial extends LocalizationState {}

class LocalizationLoaded extends LocalizationState {
  final String languageCode;

  LocalizationLoaded(this.languageCode);

  @override
  List<Object?> get props => [languageCode];
}

// Bloc
class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  static const String _languageKey = 'selected_language';

  LocalizationBloc() : super(LocalizationInitial()) {
    on<LoadLocalization>(_onLoadLocalization);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  Future<void> _onLoadLocalization(
      LoadLocalization event, Emitter<LocalizationState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey) ;
    // ??
        // AppLocalizations.defaultLanguage; // Default language
    emit(LocalizationLoaded(languageCode!));
  }

  Future<void> _onChangeLanguage(
      ChangeLanguage event, Emitter<LocalizationState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, event.languageCode);
    emit(LocalizationLoaded(event.languageCode));
  }
}