import 'package:hiking_nepal/features/post/data/model/add_post_model.dart';

abstract class PostRepository {
  ///Uploads and retrieves string to the path of the uploaded image.
  String uploadImage(PostModel postEntity);
}
