import 'package:equatable/equatable.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/app_settings_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/user_entitiy.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final AppSettingsEntity? appSettings;
  final UserEntity? userEntity;

  const HomeState({
    this.errorMessage,
    this.isLoading = true,
    this.userEntity,

    this.appSettings
  });
  
  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    UserEntity? userEntity,
    AppSettingsEntity? appSettings,
  }) {
    return HomeState(
      errorMessage: errorMessage ?? this.errorMessage,
      userEntity: userEntity ?? this.userEntity,
      appSettings: appSettings ?? this.appSettings,
      isLoading: isLoading ?? this.isLoading,
    );
  }
  @override 
  List<Object?> get props => [
        isLoading,
        appSettings,
        userEntity,
        errorMessage,
      ];
}