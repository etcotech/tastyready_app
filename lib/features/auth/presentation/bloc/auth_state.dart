import 'package:equatable/equatable.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/city_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';



class AuthState  extends Equatable {
  final String loginEmail;
  final bool isPhoneLogin;
  final String loginPassword;
  final String loginPhone;
  final String signupName;
  final String signupEmail;
  final String signupPhone;
  final String signupCountryId;
  final String signupCityId;
  final String appSecret;
  final List<CountryEntity> countries;
  final List<CityEntity> cities;
  final String token;
  final String signupPassword;
  final bool isSubmitting;
  final bool isLoginSuccess;
  final bool isSignupSuccess;
  final String? error;
  final String? signUpError;
  final bool isLoading;
  final bool isCountriesLoading;
  final bool isCitiesLoading;
  final String? nameValidationError;
  final String? emailValidationError;
  final String? passwordValidationError;
  final String? phoneValidationError;
  final String? countryIdValidationError;
  final String? cityIdValidationError;
  final String? appSecretValidationError;
  final String? loginEmailValidationError;
  final String? loginPasswordValidationError;
 final bool isOtpDone;
    final String otpCode; 

  const AuthState(
    {
    this.isOtpDone = false,
    this.otpCode = '',
    this.cities = const [],
    this.loginPhone = '',
    this.isPhoneLogin = true,
    this.nameValidationError ,
    this.emailValidationError,
    this.passwordValidationError,
    this.phoneValidationError ,
    this.countryIdValidationError ,
    this.cityIdValidationError ,
    this.appSecretValidationError ,
    this.loginEmailValidationError ,
    this.loginPasswordValidationError,

      this.signUpError,
    this.isCountriesLoading = false,
    this.isCitiesLoading = false,
    this.countries = const [],
    this.token = '',
    this.signupPhone='', 
    this.signupCountryId='',
     this.signupCityId='',
      this.appSecret='', 
      this.isLoading = false,
    this.loginEmail = '',
    this.loginPassword = '',
    this.signupName = '',
    this.signupEmail = '',
    this.signupPassword = '',
    this.isSubmitting = false,
    this.isLoginSuccess = false,
    this.isSignupSuccess = false,
    this.error,
  });

  bool get isLoginFormValid => loginEmail.isNotEmpty && loginPassword.isNotEmpty;
  bool get isSignupFormValid =>
  
      signupName.isNotEmpty &&
      signupEmail.isNotEmpty &&
      signupPassword.isNotEmpty &&
      signupPhone.isNotEmpty &&
      signupCountryId.isNotEmpty &&
      signupCityId.isNotEmpty &&
      appSecret.isNotEmpty;

      
      
      

  AuthState copyWith({
    bool? isOtpDone ,
    String? otpCode,
    List<CityEntity>? cities,
    String? loginPhone,
    bool? isPhoneLogin ,
    String? nameValidationError,
    String? emailValidationError,
    String? passwordValidationError,
    String? phoneValidationError,
    String? countryIdValidationError,
    String? cityIdValidationError,
    String? appSecretValidationError,
    String? loginEmailValidationError,
    String? loginPasswordValidationError,
   


    List<CountryEntity>? countries,
    String? token,
    String? signUpError,
    bool isCountriesLoading = false,
    bool isCitiesLoading = false,
    String? loginEmail,
    String? loginPassword,
    String? signupName,
    String? signupEmail,
    String? signupPassword,
    String? signupPhone,
    String? signupCountryId,
    String? signupCityId,
    String? appSecret,
bool isLoading = false,
    bool? isSubmitting,
    bool? isLoginSuccess,
    bool? isSignupSuccess,
    String? error,
  }) {
    return AuthState(
      isOtpDone: isOtpDone?? this.isOtpDone,
      otpCode: otpCode ?? this.otpCode,
      loginPhone: loginPhone ?? this.loginPhone,
      cities: cities ?? this.cities,
      isPhoneLogin: isPhoneLogin?? this.isPhoneLogin,
      nameValidationError: nameValidationError  ,
      emailValidationError: emailValidationError,
      passwordValidationError: passwordValidationError ,
      phoneValidationError: phoneValidationError ,
      countryIdValidationError: countryIdValidationError ,
      cityIdValidationError: cityIdValidationError ,

      appSecretValidationError: appSecretValidationError ,
      loginEmailValidationError: loginEmailValidationError,

      loginPasswordValidationError: loginPasswordValidationError ,
      signUpError: signUpError ?? this.signUpError,
      isCountriesLoading: isCountriesLoading,
      isCitiesLoading: isCitiesLoading,
      countries: countries ?? this.countries,
      token: token ?? this.token,
      isLoading: isLoading,
      signupPhone: signupPhone ?? this.signupPhone,
      signupCountryId: signupCountryId ?? this.signupCountryId,
      signupCityId: signupCityId ?? this.signupCityId,
      appSecret: appSecret ?? this.appSecret,

      loginEmail: loginEmail ?? this.loginEmail,
      loginPassword: loginPassword ?? this.loginPassword,
      signupName: signupName ?? this.signupName,
      signupEmail: signupEmail ?? this.signupEmail,
      signupPassword: signupPassword ?? this.signupPassword,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
      isSignupSuccess: isSignupSuccess ?? this.isSignupSuccess,
      error: error ?? this.error,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [ 
    isOtpDone,
    otpCode,
    nameValidationError,
    emailValidationError,
    passwordValidationError,
    phoneValidationError,
    countryIdValidationError,
    cityIdValidationError,
    appSecretValidationError,
    loginEmailValidationError,
    loginPasswordValidationError,
loginPhone,
    countries,
    cities,
    token,
    signUpError,
    isCountriesLoading,
    isCitiesLoading,
    loginEmail,
    loginPassword,
    signupName,
    signupEmail,
    signupPassword,
    signupPhone,
    signupCountryId,
    signupCityId,
    appSecret,
    isLoading,
    isSubmitting,
    isLoginSuccess,
    isSignupSuccess,
    error,
    isPhoneLogin
    
    ];
}

/*
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}
class AuthCountriesLoading extends AuthState {}
class AuthCountriesLoaded extends AuthState {
  final List<CountryEntity> countries;

  const AuthCountriesLoaded(this.countries);

  @override
  List<Object?> get props => [countries];
}
class AuthAuthenticated extends AuthState {
  final UserEntity userModel;

  const AuthAuthenticated(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}


*/