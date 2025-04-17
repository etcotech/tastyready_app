import 'dart:developer';

import 'package:tastyready_mobile/core/constants/apis.dart';
import 'package:tastyready_mobile/core/network/api_client.dart';
import 'package:tastyready_mobile/features/auth/data/models/app_settings_model.dart';
import 'package:tastyready_mobile/features/auth/data/models/city_model.dart';
import 'package:tastyready_mobile/features/auth/data/models/country_model.dart';
import 'package:tastyready_mobile/features/auth/data/models/login_success_model.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/app_settings_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/city_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/login_sucess_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/user_entitiy.dart';

abstract class AuthRemoteDataSource {
  Future<LoginSucessEntity> login(String email, String password);
  Future<LoginSucessEntity> loginWithPhone(String phone, String password);
  Future<void> sendOtp(String phone);

 Future<UserEntity> getUserData(String token);

  Future<String> register(
    String appSecret ,
    String name, String email,  String phone , String password, String countryId, String cityId,);
    Future<List<CountryEntity>> getCountries();
        Future<List<CityEntity>> getCities(String countryId);

    Future<AppSettingsEntity> getAppSettings();

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient? client;

  AuthRemoteDataSourceImpl({required this.client});


  @override
  Future<LoginSucessEntity> login(String email, String password) async {
    final response = await client!.postFormData(
    Apis.login,
      formData: {'email': email, 'password': password},
    );
log( response.runtimeType.toString());

      return LoginSuccessModel.fromJson(response).toEntity();
    
  }

  @override
  Future<String> register( String appSecret ,
    String name, String email,  String phone , String password, String countryId, String cityId,) async {
    final response = await client!.postFormData(
    Apis.register,
      formData: {
        "app_secret": appSecret,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "country_id": countryId,
        "city_id": cityId,
      }
    );
log( response.toString()); 

      return  response['token'];
    
  }
  
  @override
  Future<List<CountryEntity>> getCountries() async{
    final response = await client!.get(
      Apis.countriesUrl,
    
    );

      List<CountryEntity> countries = [];
      for (var country in response['data']) {
        countries.add(CountryModel.fromJson(country).toEntity());
      }
      return countries;
    // 
  }
  
  @override
  Future<AppSettingsEntity> getAppSettings() async{
    final response = await client!.get(
      Apis.settingsUrl,
    
    );

      return AppSettingsModel.fromJson(response.body).toEntity();
  }
  
  @override
  Future<UserEntity> getUserData(String token) async{
     final response = await client!.get(
      Apis.settingsUrl+"?api_token=${token}",
    
    );

      return AppSettingsModel.fromJson(response.body).toEntity();
  }
  
  @override
  Future<LoginSucessEntity> loginWithPhone(String phone, String password) async{
    final response = await client!.postFormData(
    Apis.login,
      formData: {'phone': phone, 'password': password},
    );
log( response.runtimeType.toString());

      return LoginSuccessModel.fromJson(response).toEntity();
  }
  
  @override
  Future<List<CityEntity>> getCities(String countryId)async {
    final response = await client!.get(
      Apis.citiesUrl+countryId,
    
    );

      List<CityEntity> cities = [];
      for (var country in response['data']) {
        cities.add(CityModel.fromJson(country).toEntity());
      }
      return cities;
  }
  
  @override
  Future<void> sendOtp(String phone) async{
    final response = await client!.post(
      Apis.forgotPassword,
      data: {'phone': phone},
    );
    log( response.runtimeType.toString());

      return response;
  }
}