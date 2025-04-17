import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tastyready_mobile/core/constants/apis.dart';
import 'package:tastyready_mobile/core/network/api_client.dart';
import 'package:tastyready_mobile/di.dart';


void registerCommonDependencies()async {
  
//shared prefecences
var sharedPreferences =await SharedPreferences.getInstance();
sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

//network
//sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//api clinet
//dio 
sl.registerLazySingleton<ApiClient>(() => ApiClient(
dio: sl()


));


//api client
//sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));

//local data source
//sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl()));

//dio 
sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl:Apis.baseUrl)));

}

