import 'package:image_picker/image_picker.dart';

abstract class PostRepository {
  ///Uploads and retrieves [String] to the path of the uploaded image.
  ///[uid] is the unique id of the user corresponding to the post.
  Future<String> uploadImage(XFile xfile, String uid);
}
