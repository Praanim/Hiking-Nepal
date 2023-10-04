import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hiking_nepal/features/auth/data/remote_data_source/user_remote_data_source_impl.dart';
import 'package:hiking_nepal/features/auth/data/repo/user_repository_impl.dart';
import 'package:hiking_nepal/features/auth/domain/repository/user_remote_data_source.dart';
import 'package:hiking_nepal/features/auth/domain/repository/user_repository.dart';
import 'package:hiking_nepal/features/auth/presentaion/cubit/auth_cubit.dart';

//get it instance
final sl = GetIt.instance;

//method to initialize classes required in the app
Future<void> intializeDependences() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Firebase Auth
  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  //Dependencies
  sl.registerSingleton<UserRemoteDataSource>(
      UserRemoteDataSourceImpl(auth: sl()));
  sl.registerSingleton<UserRepository>(
      UserRepositoryImpl(userRemoteDataSource: sl()));

  //Blocs
  sl.registerFactory<AuthCubit>(() => AuthCubit(userRepository: sl()));
}
