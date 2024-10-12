import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable{
   const ImagePickerState({
    this.file,
});

  final XFile? file;


   ImagePickerState copyWith({XFile? file}){
     return ImagePickerState(
       file: file ?? this.file
     );
}

  @override
  // TODO: implement props
  List<Object?> get props => [file];
}

