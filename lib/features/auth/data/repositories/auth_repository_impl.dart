
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tastyready_mobile/core/errors/dio_exceptions.dart';
import 'package:tastyready_mobile/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:tastyready_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/city_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/login_sucess_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/user_entitiy.dart';
import 'package:tastyready_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource authLocal;

  AuthRepositoryImpl(this.remoteDataSource, this.authLocal);

  @override
  Future<Either<ApiException, LoginSucessEntity>> login(String email, String password) async {
    try {
      final user = await remoteDataSource.login(email, password);
      return Right(user);
    }  on ApiException catch (failure) {
        return Left(failure);
      }
  }

  @override
  Future<Either<ApiException, String>> register({String? appSecret ,
    String? name, String? email,  String? phone , String? password, String? countryId, String? cityId,}) async {
    try {
      final token = await remoteDataSource.register(appSecret!, name!, email!, phone!, password!, countryId!, cityId!);


      return Right(token);
    }  on ApiException catch (failure) {
        return Left(failure);
      }
  }

  @override
  Future<Either<ApiException, List<CountryEntity>>> getCountris() async{
   
    try {
      final countries = await remoteDataSource.getCountries();
      log(countries.toString());
      return Right(countries);
    } on ApiException catch (failure) {
      return Left(failure);
    }
  }
  
  @override
  void SaveToken(String token) {
    authLocal.cacheToken(token);
  }
  
  @override
  String getToken() {
    return authLocal.getToken()??'';
  }
  
  @override
  void removeToken() {
    authLocal.clearToken();
  }
  
  @override
  void updateAuthHeaders(String token) {
    // authLocal.updateAuthHeaders(token);
  }
  
  @override
  void saveLoggedInStatus(bool isLoggedIn) {
    authLocal.saveLoggedInSatus(isLoggedIn);
  }
  
  @override
  bool isFirstTime() {
    return authLocal.isFirstTime();
  }
  
  @override
  bool isLoggedIn() {
    return authLocal.isLoggedIn();
  }
  
  @override
  void saveFirstTimeStatus(bool isFirstTime) {
    authLocal.saveFirstTimeStatus(isFirstTime);
  }

  @override
  Future<Either<ApiException, UserEntity>> getUserData() async{
    try {
      final user = await remoteDataSource.getUserData(getToken());
      return Right(user);
    } on ApiException catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<ApiException, String>> getAppSettings() {
    // TODO: implement getAppSettings
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiException, List<CityEntity>>> getCities(String countryId)async {
    try {
      final cities = await remoteDataSource.getCities(countryId);
      return Right(cities);
    } on ApiException catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<ApiException, LoginSucessEntity>> loginWithPhoneNumber(String phone, String password)async {
    try {
      final user = await remoteDataSource.loginWithPhone(phone, password);
      return Right(user);
    }  on ApiException catch (failure) {
        return Left(failure);
      }
  }
  
  @override
  Future<Either<ApiException, void>> sendOtp(String phone) async{
   
    try {
      final user = await remoteDataSource.sendOtp(phone);
      return Right(user);
    }  on ApiException catch (failure) {
        return Left(failure);
      }
  }
}