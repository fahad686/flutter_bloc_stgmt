import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_series/presentation/features/image_picker/Image_picker_bloc/image_picker_event.dart';
import 'package:flutter_bloc_series/presentation/features/image_picker/Image_picker_bloc/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/image_picker_util.dart';

class  ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerState>{




 final ImagePickerUtil imagePickerUtil;


  ImagePickerBloc(this.imagePickerUtil):super(const ImagePickerState()){
    on<CameraCapture>(cameraCapture);
    on<GalleryPicker>(galleryPicker);
  }

  void cameraCapture(CameraCapture event,Emitter<ImagePickerState> states)async{
    XFile? file=await imagePickerUtil.pickImageFromCamera();
    emit(state.copyWith(file:file));

  }
  void galleryPicker(GalleryPicker event,Emitter<ImagePickerState> states)async{
    XFile? file=await imagePickerUtil.pickImageFromGallery();
    emit(state.copyWith(file:file));

  }
}