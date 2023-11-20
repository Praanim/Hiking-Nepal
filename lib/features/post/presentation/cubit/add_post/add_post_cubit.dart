import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hiking_nepal/features/post/data/model/post_model.dart';
import 'package:hiking_nepal/features/post/domain/repository/post_repository.dart';
import 'package:image_picker/image_picker.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  ///We will edit this instance variable and it will work as recent state
  PostModel _postModel = const PostModel();

  ///[PostRepository] instance variable
  final PostRepository postRepository;

  ///constructor
  AddPostCubit({
    required this.postRepository,
  }) : super(const AddPostInitial(postModel: null));

  void editDataClass(
      {String? name,
      String? category,
      int? cost,
      String? date,
      String? description,
      String? location,
      int? time}) {
    //editing the state class
    _postModel = _postModel.copyWith(
      name: name,
      category: category,
      cost: cost,
      date: date,
      description: description,
      location: location,
      time: time,
    );
    //emitting state
    emit(AddPostIntermediateData(postModel: _postModel));
  }

  void addPost(XFile xFile, String uid) async {
    try {
      final result = await postRepository.uploadImage(xFile, uid);
      print(result);
      emit(AddPostSuccess(postModel: _postModel));
    } on FirebaseException catch (e) {
      emit(AddPostFailure(message: e.message ?? e.code));
    } on Exception catch (e) {
      emit(AddPostFailure(message: e.toString()));
    }
  }
}
