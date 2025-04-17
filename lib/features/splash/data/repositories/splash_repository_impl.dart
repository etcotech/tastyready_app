import 'package:dartz/dartz.dart';
import 'package:tastyready_mobile/core/errors/dio_exceptions.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/app_settings_entity.dart';
import 'package:tastyready_mobile/features/splash/data/datasources/remote/splash_remote_date_source.dart';
import 'package:tastyready_mobile/features/splash/domain/repositories/splash_repoitory.dart';

class SplashRepositoryImpl extends SplashRepository {
  final SplashRemoteDateSource splashRemoteDateSource;

  SplashRepositoryImpl({required this.splashRemoteDateSource});

  @override
  Future<Either<ApiException, AppSettingsEntity>> getAppSettings() async{
   
    try {
      final response = await splashRemoteDateSource.getAppSettings(
        
      );
      return Right(response);
    } on ApiException catch (e) {
      return Left(e);
   
    }}

  
  
}