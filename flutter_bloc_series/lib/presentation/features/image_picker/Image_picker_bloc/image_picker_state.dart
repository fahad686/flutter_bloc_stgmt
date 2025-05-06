import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable{

  final XFile ?file;
  const ImagePickerState({this.file});

 // copy  function to   creating new instance
  ImagePickerState copyWith({
    XFile ?file
  }){
    return ImagePickerState(
      //passing state to constructor whether if null
        file: file?? this.file
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [file];




}