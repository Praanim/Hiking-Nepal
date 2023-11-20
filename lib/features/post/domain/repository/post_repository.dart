import 'package:hiking_nepal/features/post/data/model/post_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class PostRepository {
  ///Uploads and retrieves [String] to the path of the uploaded image.
  ///[uid] is the unique id of the user corresponding to the post.
  Future<String> uploadImage(XFile xfile, String uid);

  ///Saves the post created by user in Firebase database
  Future<void> addPost(PostModel postModel);
}
