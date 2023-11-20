import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hiking_nepal/features/post/data/model/post_model.dart';
import 'package:image_picker/image_picker.dart';

import 'package:hiking_nepal/features/post/domain/repository/post_remote_data_source.dart';

class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  ///Firebase storage instance
  final FirebaseStorage firebaseStorage;

  ///[FirebaseFirestore] instance variable;
  final FirebaseFirestore firebaseFirestore;

  ///default constructor
  PostRemoteDataSourceImpl({
    required this.firebaseStorage,
    required this.firebaseFirestore,
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

  @override
  Future<void> addPost(PostModel postModel) async {
    // Reference to the 'posts' collection
    CollectionReference postsCollection =
        FirebaseFirestore.instance.collection('posts');
    try {
      // Add the data to Firestore
      await postsCollection.add(postModel.toMap());
    } catch (e) {
      throw Exception('Error uploading data: $e');
    }
  }
}
