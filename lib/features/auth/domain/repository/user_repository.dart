import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiking_nepal/features/auth/domain/entities/user_entity.dart';

///UserRepository interface class
abstract class UserRepository {
  ///SignIn user
  Future<void> signIn({required UserEntity user});

  //user auth state
  Stream<User?> authStateChanges();
}
