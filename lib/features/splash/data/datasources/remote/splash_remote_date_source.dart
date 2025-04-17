import 'dart:developer';

import 'package:tastyready_mobile/core/constants/apis.dart';
import 'package:tastyready_mobile/core/network/api_client.dart';
import 'package:tastyready_mobile/features/auth/data/models/app_settings_model.dart';

import 'package:tastyready_mobile/features/auth/domain/entities/app_settings_entity.dart';


abstract class SplashRemoteDateSource {
  Future<AppSettingsEntity> getAppSettings();


}

class SplashRemoteDateSourceImpl implements SplashRemoteDateSource {
  final ApiClient? client;

  SplashRemoteDateSourceImpl({required this.client});
  
  @override
  Future<AppSettingsEntity> getAppSettings() async{
    final response = await client!.get(
      Apis.settingsUrl,
    );
    log( response.toString());
    return AppSettingsModel.fromJson(response).toEntity();
  }


  


}