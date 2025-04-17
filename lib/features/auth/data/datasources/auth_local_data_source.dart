import 'package:shared_preferences/shared_preferences.dart';
import 'package:tastyready_mobile/core/constants/strings.dart';

abstract class AuthLocalDataSource {
void cacheToken(String token);
 String? getToken();
 void clearToken();
 void saveLoggedInSatus(bool isLoggedIn);
 bool isLoggedIn();
  void saveFirstTimeStatus(bool isFirstTime);
  bool isFirstTime();
  
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});


  @override
void cacheToken(String token)  {
     sharedPreferences.setString(Strings.cachedToken, token);
  }

  @override
String? getToken()  {
    return sharedPreferences.getString(Strings.cachedToken);
  }

  @override
  void  clearToken()  {
     sharedPreferences.remove(Strings.cachedToken);
  }
  
  @override
  void saveLoggedInSatus(bool isLoggedIn) {
    // TODO: implement saveLoggedInSatus
    sharedPreferences.setBool(Strings.isLoggedIn, isLoggedIn);
  }
  
  @override
  bool isFirstTime() {
    return sharedPreferences.getBool(Strings.isFirstTime) ?? true;
  }
  
  @override
  bool isLoggedIn() {
    return sharedPreferences.getBool(Strings.isLoggedIn) ?? false;
  }
  
  @override
  void saveFirstTimeStatus(bool isFirstTime) {
    sharedPreferences.setBool(Strings.isFirstTime, isFirstTime);
  }
}