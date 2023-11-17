import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hiking_nepal/features/post/data/model/add_post_model.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(const AddPostInitial(postModel: null));

  PostModel _postModel = PostModel();

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
}
