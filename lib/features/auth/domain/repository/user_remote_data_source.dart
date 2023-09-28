//User Remote Data Source interface class
import 'package:hiking_nepal/features/auth/domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  //Sign in user
  Future<void> sigIn({required UserEntity user});
}
