import 'package:get_it/get_it.dart';
import 'package:tastyready_mobile/core/di/auth.dart';
import 'package:tastyready_mobile/core/di/common.dart';
import 'package:tastyready_mobile/core/di/splash.dart';
final GetIt sl = GetIt.instance;

Future<void> init()async{



registerAuthFeature();

registerSplashFeature();
  //register common 
registerCommonDependencies();


}