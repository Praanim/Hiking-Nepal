import 'package:firebase_auth/firebase_auth.dart';

import 'package:hiking_nepal/features/post/domain/repository/post_remote_data_source.dart';
import 'package:hiking_nepal/features/post/domain/repository/post_repository.dart';
import 'package:image_picker/image_picker.dart';

class PostRepositoryImpl extends PostRepository {
  ///[PostRemoteDataSource] instance variable
  final PostRemoteDataSource postRemoteDataSource;

  PostRepositoryImpl({required this.postRemoteDataSource});

  @override
  Future<String> uploadImage(XFile xFile, String uid) async {
    try {
      final result = await postRemoteDataSource.uploadImage(xFile, uid);
      return result;
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.plugin, code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
