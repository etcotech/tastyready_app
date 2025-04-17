// Splash Bloc
import 'package:bloc/bloc.dart';
import 'package:tastyready_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:tastyready_mobile/features/splash/domain/repositories/splash_repoitory.dart';
import 'package:tastyready_mobile/features/splash/presentation/bloc/splash_event.dart';
import 'package:tastyready_mobile/features/splash/presentation/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository authRepository;
 final SplashRepository splashRepository;
  SplashBloc( this.splashRepository,  this.authRepository) : super(SplashState()) {
    on<CheckLoginStatus>((event, emit) async {
      emit(state.copyWith(isAutheticated: false));
      final isLoggedIn = authRepository.isLoggedIn();
      if (isLoggedIn) {
        emit(state.copyWith(isAutheticated: true));
      } else {
        emit(state.copyWith(isAutheticated: false));
      }
    });

   on<CheckingFirstTime>((event, emit) async {
  //  await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(isFirstTime: false));
      final isFirstTime = authRepository.isFirstTime();
      if (isFirstTime) {
      emit(state.copyWith(isFirstTime: true));
      } else {
      emit(state.copyWith(isFirstTime: false));
      }
    });
     on<UpdateirstTime>((event, emit) async {
// await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(isFirstTime: false));
       authRepository.saveFirstTimeStatus(false);
     
      emit(state.copyWith(isFirstTime: true));
      
    });

 on<LoadAppSettings>((event, emit) async {
// await Future.delayed(const Duration(seconds: 2));
       splashRepository.getAppSettings();
     
      
    });

  }
}