import 'package:tastyready_mobile/di.dart';
import 'package:tastyready_mobile/features/splash/data/datasources/remote/splash_remote_date_source.dart';
import 'package:tastyready_mobile/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:tastyready_mobile/features/splash/domain/repositories/splash_repoitory.dart';
import 'package:tastyready_mobile/features/splash/presentation/bloc/splash_bloc.dart';

Future<void> registerSplashFeature()async{
  sl.registerFactory<SplashBloc>(() => SplashBloc( sl() ,sl()));


  sl.registerFactory<SplashRepository>(() => SplashRepositoryImpl(splashRemoteDateSource: sl()));

  sl.registerFactory<SplashRemoteDateSource>(() => SplashRemoteDateSourceImpl(client: sl()));
}