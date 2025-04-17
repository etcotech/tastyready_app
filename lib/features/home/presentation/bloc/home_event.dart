import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadUserDataEvent extends HomeEvent {
  const LoadUserDataEvent();

  @override
  List<Object?> get props => [];
}

class LoadSettingsEvent extends HomeEvent {
  const LoadSettingsEvent();

  @override
  List<Object?> get props => [];
}