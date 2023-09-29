import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiking_nepal/features/auth/domain/entities/user_entity.dart';
import 'package:hiking_nepal/features/auth/domain/repository/user_remote_data_source.dart';
import 'package:hiking_nepal/features/auth/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  ///UserRemoteDataSource instance
  final UserRemoteDataSource userRemoteDataSource;

  ///UserRepositoryImpl constructor
  UserRepositoryImpl({
    required this.userRemoteDataSource,
  });

  @override
  Future<void> signIn({required UserEntity user}) async {
    try {
      await userRemoteDataSource.sigIn(user: user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
