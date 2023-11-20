import 'package:image_picker/image_picker.dart';

abstract class PostRemoteDataSource {
  ///Uploads and retrieves [String] to the path of the uploaded image.
  Future<String> uploadImage(XFile xfile, String uid);
}
