import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_bloc/bloc/image_picker/image_picker_event.dart';
import 'package:image_picker_bloc/bloc/image_picker/image_picker_state.dart';
import 'package:image_picker_bloc/utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  final ImagePickerUtils imagePickerUtils ;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(galleryImageCapture);
  }

  void cameraCapture(CameraCapture event,Emitter<ImagePickerState> states)async{
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file:file));
  }

  void galleryImageCapture(GalleryImagePicker event,Emitter<ImagePickerState> states)async{
    XFile? file = await imagePickerUtils.imageFromGallery();
    emit(state.copyWith(file:file));
  }
}

