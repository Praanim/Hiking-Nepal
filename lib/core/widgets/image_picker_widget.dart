import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends Cubit<XFile?> {
  ///image picker instance
  final ImagePicker imagePicker;

  ///constructor
  ImagePickerWidget({required this.imagePicker}) : super(null);

  void pickImageFromGallery() async {
    try {
      final xfile = await imagePicker.pickImage(source: ImageSource.gallery);
      if (xfile == null) {
        emit(null); //null case
      } else {
        emit(xfile); //success case
      }
    } catch (e) {
      print(e);
      emit(null);
    }
  }
}
