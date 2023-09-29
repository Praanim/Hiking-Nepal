import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hiking_nepal/features/auth/domain/entities/user_entity.dart';
import 'package:hiking_nepal/features/auth/domain/repository/user_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(AuthInitial());

  ///UserRepository
  final UserRepository _userRepository;

  ///signIn user
  Future<void> sigInUser({required UserEntity user}) async {
    try {
      await _userRepository.signIn(user: user);
      emit(Authenticated());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(message: e.code));
    } catch (e) {
      emit(AuthFailed(message: e.toString()));
    }
  }
}
