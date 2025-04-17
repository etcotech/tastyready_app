import 'package:dartz/dartz.dart';
import 'package:tastyready_mobile/core/errors/dio_exceptions.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/city_entity.dart';

import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/login_sucess_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/user_entitiy.dart';

abstract class AuthRepository {
  Future<Either<ApiException, LoginSucessEntity>> login(String email, String password);
    Future<Either<ApiException, LoginSucessEntity>> loginWithPhoneNumber(String phone, String password);
    Future<Either<ApiException, void>> sendOtp(String phone);

  Future<Either<ApiException, UserEntity>> getUserData();
  Future<Either<ApiException, String>> register({String appSecret ,
    String name, String email,  String phone , String password, String countryId, String cityId,});
    Future<Either<ApiException, List<CountryEntity>>> getCountris();
        Future<Either<ApiException, List<CityEntity>>> getCities( String countryId);
  Future<Either<ApiException, String>> getAppSettings();

  void updateAuthHeaders(String token);
  void SaveToken(String token);
  void removeToken();
  String getToken();
  void saveLoggedInStatus(bool isLoggedIn);
void saveFirstTimeStatus(bool isFirstTime);
  bool isLoggedIn();
  bool isFirstTime();
}
