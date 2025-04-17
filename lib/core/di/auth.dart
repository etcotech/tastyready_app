import 'package:tastyready_mobile/di.dart';
import 'package:tastyready_mobile/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:tastyready_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tastyready_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tastyready_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_bloc.dart';

Future<void> registerAuthFeature()async{


//bloc
sl.registerFactory<AuthBloc>(() => AuthBloc(authRepository: sl()));

//auth repository
sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()));
//remote data source
sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(client: sl()));
//local data source
sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sharedPreferences: sl()));
}