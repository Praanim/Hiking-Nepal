import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hiking_nepal/features/post/domain/repository/post_remote_data_source.dart';
import 'package:image_picker/image_picker.dart';

class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  ///Firebase storage instance
  final FirebaseStorage firebaseStorage;

  ///default constructor
  PostRemoteDataSourceImpl({
    required this.firebaseStorage,
  });

  @override
  Future<String> uploadImage(XFile xfile, String uid) async {
    try {
      final storageRef =
          firebaseStorage.ref().child('posts').child('$uid/${xfile.name}');
      UploadTask uploadTask = storageRef.putFile(File(xfile.path));
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      return downloadUrl;
    } on FirebaseException {
      throw FirebaseException(
          plugin: "Firebase Storage", code: 'Could not upload image!.');
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
