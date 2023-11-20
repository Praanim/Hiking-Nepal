part of 'add_post_cubit.dart';

sealed class AddPostState extends Equatable {
  final PostModel? postModel;

  const AddPostState({required this.postModel});
  @override
  List<Object> get props => [];
}

final class AddPostInitial extends AddPostState {
  const AddPostInitial({required super.postModel});
}

final class AddPostSuccess extends AddPostState {
  ///Sucess message
  final String successMssg;
  const AddPostSuccess({required this.successMssg}) : super(postModel: null);
}

final class AddPostFailure extends AddPostState {
  ///The reason of the failure of the state
  final String message;

  const AddPostFailure({required this.message}) : super(postModel: null);
}

///This class is responsible for user interaction such as when user
///plays around with the values in the ui then this state is emitted
final class AddPostIntermediateData extends AddPostState {
  const AddPostIntermediateData({required super.postModel});

  @override
  List<Object> get props => [postModel!];
}

final class AddPostLoading extends AddPostState {
  const AddPostLoading({required super.postModel});
}
