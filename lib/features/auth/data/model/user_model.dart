import 'package:hiking_nepal/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.uName,
      required super.email,
      required super.password,
      required super.uid});
}
