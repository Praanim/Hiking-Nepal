import 'package:hiking_nepal/features/post/data/model/post_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class PostRemoteDataSource {
  ///Uploads and retrieves [String] to the path of the uploaded image.
  Future<String> uploadImage(XFile xfile, String uid);

  ///Saves the post created by user in Firebase database
  Future<void> addPost(PostModel postModel);
}
