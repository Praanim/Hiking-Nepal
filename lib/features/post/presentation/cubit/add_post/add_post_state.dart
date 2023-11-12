part of 'add_post_cubit.dart';

sealed class AddPostState extends Equatable {
  const AddPostState();

  @override
  List<Object> get props => [];
}

final class AddPostInitial extends AddPostState {}

final class AddPostSuccess extends AddPostState {}

final class AddPostFailure extends AddPostState {
  ///the reason of the failure of the state
  final String message;

  const AddPostFailure({required this.message});
}

///This class is responsible for user interaction such as when user
///plays around with the values in the ui then this state is emitted
final class AddPostIntermediateData extends AddPostState {
  ///post model data class
  final PostModel postModel;

  const AddPostIntermediateData({required this.postModel});

  @override
  List<Object> get props => [postModel];
}

final class AddPostLoading extends AddPostState {}
