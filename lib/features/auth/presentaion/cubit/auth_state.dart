part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

///Auth initial State
class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

///Auth Loading State
class AuthLoading extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

///Auth Authenticated State
class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

///Auth Failed State
class AuthFailed extends AuthState {
  final String message;
  const AuthFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
