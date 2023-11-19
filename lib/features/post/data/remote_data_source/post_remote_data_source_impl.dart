import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hiking_nepal/features/post/domain/entity/post_entity.dart';
import 'package:hiking_nepal/features/post/domain/repository/post_remote_data_source.dart';

class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  ///Firebase storage instance
  final FirebaseStorage firebaseStorage;

  ///default constructor
  PostRemoteDataSourceImpl({
    required this.firebaseStorage,
  });

  @override
  Future<String> uploadImage(PostEntity postEntity, String uid) async {
    try {
      final storageRef = firebaseStorage
          .ref()
          .child('posts')
          .child('$uid/${postEntity.name!}');
      UploadTask uploadTask = storageRef.putFile(File(postEntity.image!));
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
