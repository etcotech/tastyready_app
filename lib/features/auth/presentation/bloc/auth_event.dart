import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}
class AuthLoadCountries extends AuthEvent {}
class AuthLoadCities extends AuthEvent {
  final String countryId;

  const AuthLoadCities(this.countryId);

  @override
  List<Object?> get props => [countryId];
}

class AuthStarted extends AuthEvent {}

class AuthLoggedIn extends AuthEvent {
  final String token;

  const AuthLoggedIn(this.token);

  @override
  List<Object?> get props => [token];
}

class AuthLoggedOut extends AuthEvent {}



class LoginEmailChanged extends AuthEvent {
  final String email;
  LoginEmailChanged(this.email);
}
class LoginPhoneChanged extends AuthEvent {
  final String phone;
  LoginPhoneChanged(this.phone);
}
class LoginPasswordChanged extends AuthEvent {
  final String password;
  LoginPasswordChanged(this.password);
}
class ChangeLoginViewEvent extends AuthEvent {
  final bool isPhoneLogin;
  ChangeLoginViewEvent(this.isPhoneLogin);
}
class OtpCodeSend extends AuthEvent {
  final String code;

  OtpCodeSend(this.code);
}
class OtpCodeChanged extends AuthEvent {
  final String code;

  OtpCodeChanged(this.code);
}
class PasswordResetEvent extends AuthEvent {
  final String phoneNumber;
  PasswordResetEvent(this.phoneNumber);
}

class PasswordResetSentEvent extends AuthEvent {

}

class LoginSubmitted extends AuthEvent {
  final BuildContext context;


  LoginSubmitted({required this.context});
  
}
class SignupFormSubmitted extends AuthEvent {

   final BuildContext context;

  SignupFormSubmitted(this.context);  
  
}


class SinupFormClearErros extends AuthEvent {

  SinupFormClearErros();
}
class SignupNameChanged extends AuthEvent {
  final String name;

  SignupNameChanged(this.name);
}

class SignupEmailChanged extends AuthEvent {
  final String email;
  SignupEmailChanged(this.email);
}

class SignupPasswordChanged extends AuthEvent {
  final String password;
  SignupPasswordChanged(this.password);
}
class SignupConfirmPasswordChanged extends AuthEvent {
  final String confirmPassword;
  SignupConfirmPasswordChanged(this.confirmPassword);
}
class SignupTermsChanged extends AuthEvent {
  final bool termsAccepted;
  SignupTermsChanged(this.termsAccepted);
}
class SignupCityChanged extends AuthEvent {
  final String city;
  SignupCityChanged(this.city);
}
class SignupCountryChanged extends AuthEvent {
  final String country;
  SignupCountryChanged(this.country);
}
class SignupPhoneNumberChanged extends AuthEvent {
  final String phoneNumber;
  SignupPhoneNumberChanged(this.phoneNumber);
}
class SignupCityIdChanged extends AuthEvent {
  final String cityId;
  SignupCityIdChanged(this.cityId);
}
class SignupCountryIdChanged extends AuthEvent {
  final String countryId;
  SignupCountryIdChanged(this.countryId);
}

class SignupSubmitted extends AuthEvent {}
class SignupPhoneChanged extends AuthEvent {
  final String phone;
  SignupPhoneChanged(this.phone);
}

class AppSecretChanged extends AuthEvent {
  final String appSecret;
  AppSecretChanged(this.appSecret);
}