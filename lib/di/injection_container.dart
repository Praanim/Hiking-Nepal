import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hiking_nepal/features/auth/data/remote_data_source/user_remote_data_source_impl.dart';
import 'package:hiking_nepal/features/auth/data/repo/user_repository_impl.dart';
import 'package:hiking_nepal/features/auth/domain/repository/user_remote_data_source.dart';
import 'package:hiking_nepal/features/auth/domain/repository/user_repository.dart';
import 'package:hiking_nepal/features/auth/presentaion/cubit/auth_cubit.dart';
import 'package:image_picker/image_picker.dart';

//get it instance
final getIt = GetIt.instance;

//method to initialize classes required in the app
Future<void> intializeDependences() async {
  //Dio
  getIt.registerSingleton<Dio>(Dio());

  //Firebase Auth
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  //Firebase storage
  getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);

  //Dependencies
  getIt.registerSingleton<UserRemoteDataSource>(
      UserRemoteDataSourceImpl(auth: getIt()));
  getIt.registerSingleton<UserRepository>(
      UserRepositoryImpl(userRemoteDataSource: getIt()));

  //Image picker instance
  getIt.registerSingleton<ImagePicker>(ImagePicker());

  //Blocs
  getIt.registerFactory<AuthCubit>(() => AuthCubit(userRepository: getIt()));
}
