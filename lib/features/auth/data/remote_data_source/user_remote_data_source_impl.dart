import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiking_nepal/features/auth/domain/entities/user_entity.dart';
import 'package:hiking_nepal/features/auth/domain/repository/user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  //firebase authentication object
  final FirebaseAuth auth;

  //constructor
  UserRemoteDataSourceImpl({
    required this.auth,
  });

  @override
  Future<void> sigIn({required UserEntity user}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw FirebaseAuthException(code: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw FirebaseAuthException(
            code: 'Wrong password provided for that user.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<User?> authStateChanges() {
    try {
      return auth.authStateChanges();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
