import 'package:dartz/dartz.dart';
import 'package:tastyready_mobile/core/errors/dio_exceptions.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/app_settings_entity.dart';

abstract class SplashRepository {
    Future<Either<ApiException, AppSettingsEntity>> getAppSettings();

}