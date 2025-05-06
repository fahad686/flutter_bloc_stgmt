import 'package:image_picker/image_picker.dart';

class ImagePickerUtil{


  final ImagePicker picker=ImagePicker();

  //writing function for taking picture from camera
  Future<XFile?> pickImageFromCamera()async{
    final XFile? file=await picker.pickImage(source: ImageSource.camera);
    return file;
  }
  //writing function for taking picture from gallery
  Future<XFile?> pickImageFromGallery()async{
    final XFile? file=await picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}