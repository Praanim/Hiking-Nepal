import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hiking_nepal/features/post/data/model/add_post_model.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(const AddPostInitial(postModel: null));

  ///this is our state data class and we will manipulate this property always
  final PostModel postModel = PostModel();

  void editDataClass(PostModel postModel) {
    emit(AddPostIntermediateData(
        postModel: postModel.copyWith(
      name: postModel.name,
      category: postModel.category,
      cost: postModel.cost,
      date: postModel.date,
      description: postModel.description,
      location: postModel.location,
      time: postModel.time,
    )));
  }
}
