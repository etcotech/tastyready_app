class Apis {
  static const String baseUrl = "https://tastyready.com/api/v2";

  // Authentication URLs
  static const String login = "/client/auth/gettoken";
  static const String register = "/client/auth/register";
  static const String logout = "$baseUrl/auth/logout";
  static const String refreshToken = "$baseUrl/auth/refresh-token";
  static const String countriesUrl = "/client/region/countries";
  static const String citiesUrl = "/client/region/cities/";
  static const String settingsUrl = "/client/settings";
  static const String userDataUrl = "/client/auth/data";
  static const String verifyCode = "/client/auth/verify-code";
 static const String forgotPassword ="/client/auth/forgot-password";
}