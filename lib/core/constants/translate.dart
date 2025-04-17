import 'package:flutter/material.dart';
import 'package:tastyready_mobile/core/utils/app_localizations.dart';

String? getTranslated(String? key, BuildContext context) {
  String? text = key;
  try{
    text = AppLocalization.of(context)!.translate(key);
  }catch (error){
    text = "$key";
  }
  return text;
}

String? getCurrentLang( BuildContext context) {
  String
    text = AppLocalization.of(context)!.locale.languageCode=="ar"?"ar":"en";
 
  return text;
}