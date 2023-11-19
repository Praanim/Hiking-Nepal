import 'package:hiking_nepal/features/post/domain/entity/post_entity.dart';

abstract class PostRemoteDataSource {
  ///Uploads and retrieves string to the path of the uploaded image.
  Future<String> uploadImage(PostEntity postEntity, String uid);
}
