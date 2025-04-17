import 'package:tastyready_mobile/features/auth/domain/entities/app_settings_entity.dart';

class AppSettingsModel extends AppSettingsEntity{
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

  AppSettingsModel(
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

  AppSettingsModel.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    singleMode = json['single_mode'];
    singleModeId = json['single_mode_id'];
    singleModeName = json['single_mode_name'];
    multiCity = json['multi_city'];
    currency = json['currency'];
    currencySign = json['currency_sign'] != null
        ? CurrencySign.fromJson(json['currency_sign'])
        : null;
    enableCod = json['enable_cod'];
    enableStripe = json['enable_stripe'];
    stripePublishKey = json['stripe_publish_key'];
    onesignalAndroidAppId = json['onesignal_android_app_id'];
    onesignalIosAppId = json['onesignal_ios_app_id'];
    googleApiKey = json['google_api_key'];
    driverPercentFromDeliver = json['driver_percent_from_deliver'];
    if (json['payment_methods'] != null) {
      // paymentMethods = <Null>[];
      // json['payment_methods'].forEach((v) {
      //   paymentMethods!.add(new Null.fromJson(v));
      // });
    }
    issd = json['issd'];
    isft = json['isft'];
    units = json['units'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_name'] = appName;
    data['single_mode'] = singleMode;
    data['single_mode_id'] = singleModeId;
    data['single_mode_name'] = singleModeName;
    data['multi_city'] = multiCity;
    data['currency'] = currency;
    if (currencySign != null) {
      data['currency_sign'] = currencySign!.toJson();
    }
    data['enable_cod'] = enableCod;
    data['enable_stripe'] = enableStripe;
    data['stripe_publish_key'] = stripePublishKey;
    data['onesignal_android_app_id'] = onesignalAndroidAppId;
    data['onesignal_ios_app_id'] = onesignalIosAppId;
    data['google_api_key'] = googleApiKey;
    data['driver_percent_from_deliver'] = driverPercentFromDeliver;
    if (paymentMethods != null) {
      // data['payment_methods'] =
          // this.paymentMethods!.map((v) => v.toJson()).toList();
    }
    data['issd'] = issd;
    data['isft'] = isft;
    data['units'] = units;
    return data;
  }

  toEntity() {
    return AppSettingsEntity(
      appName: appName,
      singleMode: singleMode,
      singleModeId: singleModeId,
      singleModeName: singleModeName,
      multiCity: multiCity,
      currency: currency,
      currencySign: currencySign,
      enableCod: enableCod,
      enableStripe: enableStripe,
      stripePublishKey: stripePublishKey,
      onesignalAndroidAppId: onesignalAndroidAppId,
      onesignalIosAppId: onesignalIosAppId,
      googleApiKey: googleApiKey,
      driverPercentFromDeliver: driverPercentFromDeliver,
      paymentMethods: paymentMethods,
      issd: issd,
      isft: isft,
      units: units,
    );
  }

}

class CurrencySign {
  SAR? sAR;

  CurrencySign({this.sAR});

  CurrencySign.fromJson(Map<String, dynamic> json) {
    sAR = json['SAR'] != null ? SAR.fromJson(json['SAR']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sAR != null) {
      data['SAR'] = sAR!.toJson();
    }
    return data;
  }
}

class SAR {
  String? name;
  int? code;
  int? rate;
  int? precision;
  int? subunit;
  String? symbol;
  bool? symbolFirst;
  String? decimalMark;
  String? thousandsSeparator;
  String? prefix;
  String? suffix;

  SAR(
      {this.name,
      this.code,
      this.rate,
      this.precision,
      this.subunit,
      this.symbol,
      this.symbolFirst,
      this.decimalMark,
      this.thousandsSeparator,
      this.prefix,
      this.suffix});

  SAR.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    rate = json['rate'];
    precision = json['precision'];
    subunit = json['subunit'];
    symbol = json['symbol'];
    symbolFirst = json['symbol_first'];
    decimalMark = json['decimal_mark'];
    thousandsSeparator = json['thousands_separator'];
    prefix = json['prefix'];
    suffix = json['suffix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['rate'] = rate;
    data['precision'] = precision;
    data['subunit'] = subunit;
    data['symbol'] = symbol;
    data['symbol_first'] = symbolFirst;
    data['decimal_mark'] = decimalMark;
    data['thousands_separator'] = thousandsSeparator;
    data['prefix'] = prefix;
    data['suffix'] = suffix;
    return data;
  }
}
