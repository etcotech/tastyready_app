import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tastyready_mobile/core/constants/route_names.dart';
import 'package:tastyready_mobile/core/errors/dio_exceptions.dart';
import 'package:tastyready_mobile/core/widgets/toasts.dart';
import 'package:tastyready_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:tastyready_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:tastyready_mobile/features/auth/presentation/pages/verify_phone_page.dart';
import 'package:tastyready_mobile/main.dart';


// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthState(
    isLoading: false
  )) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthLoggedIn>(_onAuthLoggedIn);
    on<AuthLoggedOut>(_onAuthLoggedOut);
    on<AuthLoadCountries>(_onAuthGetCountries);
        on<AuthLoadCities>(_onAuthGetCities);
        on<PasswordResetEvent>(_onOtpCodeSent);

    on<SignupNameChanged>(_onSignupNameChanged);
    on<SignupEmailChanged>(_onSignupEmailChanged);
    on<SignupPhoneChanged>(_onSignupPhoneChanged);
    on<SignupCityIdChanged>(_onSignupCityIdChanged);
    on<SignupCountryIdChanged>(_onSignupCountryIdChanged);
        on<LoginEmailChanged>(_onLoginEmailChanged);
                on<LoginPhoneChanged>(_onLoginPhonehanged);

        on<LoginPasswordChanged>(_onLoginPasswordChanged);

    on<SignupPasswordChanged>(  _onSignupPasswordChanged);
    on<SinupFormClearErros>(_onSignuFormClearErros);
    on<ChangeLoginViewEvent>(_onLoginViewChanged);




    on<LoginSubmitted>(_onLoginFormSubmitted);




    on<SignupFormSubmitted>(_onSignuFormSubmitted);

  }

  Future<void> _onSignupNameChanged(SignupNameChanged event, Emitter<AuthState> emit) async {
  emit(state.copyWith(
    signupName: event.name,


  ));
  
  }
 Future<void> _onSignupEmailChanged(SignupEmailChanged event, Emitter<AuthState> emit) async {
  emit(state.copyWith(
    signupEmail: event.email,

emailValidationError: null
  ));
  
  }

 Future<void> _onSignupPhoneChanged(SignupPhoneChanged event, Emitter<AuthState> emit) async {
  emit(state.copyWith(
    signupPhone: event.phone,

  ));
  
  }
Future<void> _onLoginViewChanged(ChangeLoginViewEvent event, Emitter<AuthState> emit) async {
  emit(state.copyWith(
    isPhoneLogin: event.isPhoneLogin,

  ));
  
  }


Future<void> _onSignupCountryIdChanged(SignupCountryIdChanged event, Emitter<AuthState> emit) async {
  emit(state.copyWith(
    signupCountryId: event.countryId,

  ));
  
  }
Future<void> _onLoginEmailChanged(LoginEmailChanged event, Emitter<AuthState> emit) async {
  emit(state.copyWith(
    loginEmail: event.email,

  ));
  
  }
Future<void> _onLoginPhonehanged(LoginPhoneChanged event, Emitter<AuthState> emit) async {
  emit(state.copyWith(
    loginPhone: event.phone,

  ));
  
  }
  Future<void> _onLoginPasswordChanged(LoginPasswordChanged event, Emitter<AuthState> emit) async {
  emit(state.copyWith(
    loginPassword: event.password,

  ));
  
  }

  Future<void> _onSignupCityIdChanged(SignupCityIdChanged event, Emitter<AuthState> emit) async {
  emit(state.copyWith(
    signupCityId: event.cityId,

  ));
  
  }
  Future<void> _onSignupPasswordChanged(SignupPasswordChanged event, Emitter<AuthState> emit) async {
  emit(state.copyWith(
    signupPassword: event.password,

  ));
  
  }
  
  Future<void> _onSignuFormClearErros(SinupFormClearErros event, Emitter<AuthState> emit) async {
emit(    state.copyWith(isLoading: false
, 
nameValidationError: null , 
emailValidationError: null,
phoneValidationError: null ,
passwordValidationError: null ,
appSecretValidationError: null ,

signUpError: null,
isSubmitting: false, 



));




log('CLEARED');
  }




  Future<void> _onSignuFormSubmitted(SignupFormSubmitted event, Emitter<AuthState> emit) async {
emit(    state.copyWith(isLoading: true
,

signUpError: null


));


    try {
      var user = await authRepository.register(
        name: state.signupName,
        email: state.signupEmail,
        password: state.signupPassword,
        phone: state.signupPhone,
        countryId: state.signupCountryId,
        cityId: state.signupCityId,
        appSecret: "Test_app_srcret_Test321543223"
      );

      user.fold((failure){
if (failure is ValidationException) {
  
 final errors = Map<String, dynamic>.
  from(json.decode(failure.message));

  log("Validation errors: $errors");
  for (var error in errors.keys) {
    log("$error   ${errors[error]}");
    if (error == 'name') {
  for (var nameValidationError in  errors[error]) {
    log(nameValidationError);
   emit(state.copyWith(
    nameValidationError: nameValidationError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'email') {
  for (var mailError in  errors[error]) {
   emit(state.copyWith(
    emailValidationError: mailError+ "\n",
    loginEmailValidationError: mailError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'phone') {
  for (var phoneErrror in  errors[error]) {
    log(phoneErrror);
   emit(state.copyWith(
    phoneValidationError: phoneErrror+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'password') {
  for (var passwordValidationError in  errors[error]) {
    log(passwordValidationError);
   emit(state.copyWith(
    passwordValidationError: passwordValidationError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'country_id') {
  for (var countryValidationError in  errors[error]) {
    log(countryValidationError);
   emit(state.copyWith(
    // countryValidationError: countryValidationError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'city_id') { 
  for (var cityValidationError in  errors[error]) {
    log(cityValidationError);
   emit(state.copyWith(
    // cityValidationError: cityValidationError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'app_secret') {
  for (var appSecretValidationError in  errors[error]) {
    log(appSecretValidationError);
   emit(state.copyWith(
    appSecretValidationError: appSecretValidationError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }





  }




return;

}
        emit(state.copyWith(
          signUpError: failure.message,
          isLoading: false
        ));




      }, (userModel) {
        // Handle successful login

        authRepository.SaveToken(userModel); 
// authRepository.saveLoggedInStatus(true);
        emit(state.copyWith(
          isLoading: false, 
          token: userModel
        ));

showAnimatedSnackBar(event.context, isSuccess: true , 

message: 'Registeration Done'
);
Navigator.pushNamed(event.context, RouteNames.login);
Navigator.pushAndRemoveUntil(event.context, 
 PageTransition(type: PageTransitionType.leftToRight,   child:  PhoneVerificationPage(
  phoneNumber: state.signupPhone,
 ))

, (route) => false
);

      });
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(
          signUpError: e.toString(),
          isLoading: false
        ));
    }

  }
  
  
  

  Future<void> _onLoginFormSubmitted(LoginSubmitted event, Emitter<AuthState> emit) async {
emit(    state.copyWith(isLoading: true
,

signUpError: null


));


    try {
      var user = await authRepository.loginWithPhoneNumber(
        state.loginPhone,
         state.loginPassword,
       
      );

      user.fold((failure){
if (failure is ValidationException) {
  
 final errors = Map<String, dynamic>.
  from(json.decode(failure.message));

  log("Validation errors: $errors");
  for (var error in errors.keys) {
    log("$error   ${errors[error]}");
    if (error == 'name') {
  for (var nameValidationError in  errors[error]) {
    log(nameValidationError);
   emit(state.copyWith(
    nameValidationError: nameValidationError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'email') {
  for (var mailError in  errors[error]) {
   emit(state.copyWith(
    emailValidationError: mailError+ "\n",
    loginEmailValidationError: mailError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'phone') {
  for (var phoneValidationError in  errors[error]) {
    log(phoneValidationError);
   emit(state.copyWith(
    phoneValidationError: phoneValidationError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'password') {
  for (var passwordValidationError in  errors[error]) {
    log(passwordValidationError);
   emit(state.copyWith(
    passwordValidationError: passwordValidationError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'country_id') {
  for (var countryValidationError in  errors[error]) {
    log(countryValidationError);
   emit(state.copyWith(
    // countryValidationError: countryValidationError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'city_id') { 
  for (var cityValidationError in  errors[error]) {
    log(cityValidationError);
   emit(state.copyWith(
    // cityValidationError: cityValidationError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }
if (error == 'app_secret') {
  for (var appSecretValidationError in  errors[error]) {
    log(appSecretValidationError);
   emit(state.copyWith(
    appSecretValidationError: appSecretValidationError+ "\n",
    isLoading: false,
   ));
    //  titleError =  nameValidationError +"\n";
  }
     }





  }




return;

}
        emit(state.copyWith(
          signUpError: failure.message,
          isLoading: false
        ));


showAnimatedSnackBar(event.context, isSuccess: false , 

message: failure.message.toString()
);

      }, (userModel) {
        // Handle successful login

        authRepository.SaveToken(userModel.token!); 
// authRepository.saveLoggedInStatus(true);
        emit(state.copyWith(
          isLoading: false, 
          token: userModel.token
        ));
//home
showAnimatedSnackBar(event.context, isSuccess: true , 

message: 'Login Successful'
);
Navigator.pushNamed(navigatorKey.currentContext!, RouteNames.home);

      });
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(
          signUpError: e.toString(),
          isLoading: false
        ));
    }

  }
  
  
  
  Future<void> _onAuthStarted(AuthStarted event, Emitter<AuthState> emit) async {
    emit(AuthState(isLoading: true));
    try {
      // final isSignedIn = await authRepository.isSignedIn();
      var user = await authRepository.login("", "");

      user.fold((failure){



      }, (userModel) {
        // Handle successful login
        emit(AuthState());
      });
      // final isSignedIn=false;
      // if (isSignedIn) {
      //   emit(AuthAuthenticated(user)); // Replace with actual user ID
      // } else {
      //   emit(AuthUnauthenticated());
      // }
    } catch (_) {
      emit(AuthState());
    }
  }

  Future<void> _onAuthLoggedIn(AuthLoggedIn event, Emitter<AuthState> emit) async {
    emit(AuthState(isLoading: true));
    try {
      // final isSignedIn = await authRepository.isSignedIn();
      var user = await authRepository.login("", "");

      user.fold((failure){



      }, (userModel) {
        // Handle successful login
        emit(AuthState());
      });
      // final isSignedIn=false;
      // if (isSignedIn) {
      //   emit(AuthAuthenticated(user)); // Replace with actual user ID
      // } else {
      //   emit(AuthUnauthenticated());
      // }
    } catch (_) {
      emit(AuthState());
    }
  }

  Future<void> _onAuthLoggedOut(AuthLoggedOut event, Emitter<AuthState> emit) async {
    emit(AuthState());
    // await authRepository.();
    emit(AuthState());
  }

   Future<void> _onAuthGetCountries(AuthLoadCountries event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isCountriesLoading: true, error: ''));
   
    try {
      var countriesData = await authRepository.getCountris();
      countriesData.fold((failure) {
        emit(state.copyWith(
          error: failure.message,
          isCountriesLoading: false
        ));
      }, (countries) {
        emit(state.copyWith(
          countries: countries,
          isCountriesLoading: false,
        ));
      });
    } catch (e) {
              emit(state.copyWith(
          error: e.toString(),
          isCountriesLoading: false
        ));

    }
  }

  Future<void> _onAuthGetCities(AuthLoadCities event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isCitiesLoading: true, error: ''));
   
    try {
      var citiesData = await authRepository.getCities(event.countryId);
      citiesData.fold((failure) {
        emit(state.copyWith(
          error: failure.message,
          isCitiesLoading: false
        ));
      }, (cities) {
        emit(state.copyWith(
          cities: cities,
          isCitiesLoading: false,
        ));
      });
    } catch (e) {
              emit(state.copyWith(
          error: e.toString(),
          isCitiesLoading: false
        ));

    }
  }
Future<void> _onOtpCodeSent(PasswordResetEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
                isOtpDone: false,

      
      isLoading: true, error: ''));
  
    try {
      var otpCode = await authRepository.sendOtp(event.phoneNumber);
      otpCode.fold((failure) {
        emit(state.copyWith(
          error: failure.message,
          isLoading: false
        ));
      }, (otp) {
        emit(state.copyWith(
          isLoading: false,
                    isOtpDone: true,

        ));
      });
    } catch (e) {
              emit(state.copyWith(
          error: e.toString(),
          isLoading: false
        ));

    }
  }

}