import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  //username
  final String uName;

  final String email;

  final String password;

  //unique id
  final String uid;

  const UserEntity({
    required this.uName,
    required this.email,
    required this.password,
    required this.uid,
  });

  @override
  List<Object?> get props => [
        uid //uid must be enough two differentiate two models because if model
        //then uid will definitely change
      ];
}
