import 'package:tastyready_mobile/features/auth/data/models/app_settings_model.dart';

class AppSettingsEntity {
  String? appName;
  bool? singleMode;
  dynamic singleModeId;
  String? singleModeName;
  bool? multiCity;
  String? currency;
  CurrencySign? currencySign;
  bool? enableCod;
  bool? enableStripe;
  String? stripePublishKey;
  String? onesignalAndroidAppId;
  String? onesignalIosAppId;
  String? googleApiKey;
  int? driverPercentFromDeliver;
  List<dynamic>? paymentMethods;
  bool? issd;
  bool? isft;
  String? units;

  AppSettingsEntity(
      {this.appName,
      this.singleMode,
      this.singleModeId,
      this.singleModeName,
      this.multiCity,
      this.currency,
      this.currencySign,
      this.enableCod,
      this.enableStripe,
      this.stripePublishKey,
      this.onesignalAndroidAppId,
      this.onesignalIosAppId,
      this.googleApiKey,
      this.driverPercentFromDeliver,
      this.paymentMethods,
      this.issd,
      this.isft,
      this.units});




}