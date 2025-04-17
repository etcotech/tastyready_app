import 'package:bloc/bloc.dart';
import 'package:tastyready_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:tastyready_mobile/features/home/presentation/bloc/home_event.dart';
import 'package:tastyready_mobile/features/home/presentation/bloc/home_state.dart';
import 'package:tastyready_mobile/features/splash/domain/repositories/splash_repoitory.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthRepository authRepository;
  final SplashRepository splashRepository;

  HomeBloc({
    required this.authRepository,
    required this.splashRepository,
  }) : super(HomeState()) {
    on<LoadSettingsEvent>(_onLoadSettings);
        on<LoadUserDataEvent>(_onLoadUserData);

  }
Future<void> _onLoadUserData(
      LoadUserDataEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      isLoading: true
    ));
    try {
      final userData = await authRepository.getUserData();
      userData.fold(
        (error) {
          emit(state.copyWith(
            isLoading: false,
            errorMessage: error.message,
          ));
        },
        (user) {
          emit(state.copyWith(
            isLoading: false,
            userEntity: user,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }


  Future<void> _onLoadSettings(
      LoadSettingsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      isLoading: true
    ));
    try {
      final settingsData = await splashRepository.getAppSettings();
     
settingsData.fold(
        (error) {
          emit(state.copyWith(
            isLoading: false,
            errorMessage: error.message,
          ));
        },
        (settings) {
          emit(state.copyWith(
            isLoading: false,
            appSettings: settings,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }


}