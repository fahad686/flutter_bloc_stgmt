import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_series/presentation/features/image_picker/Image_picker_bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_series/presentation/features/image_picker/Image_picker_bloc/image_picker_event.dart';
import 'package:flutter_bloc_series/presentation/features/image_picker/Image_picker_bloc/image_picker_state.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image picker screen"),centerTitle: true),
      body: Center(
        child: BlocBuilder< ImagePickerBloc,ImagePickerState>(builder: (context,state){
          return state.file==null? Row(
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: (){
                      //here we calling function  of camera capture
                      context.read<ImagePickerBloc>().add(CameraCapture());
                    },
                    child: CircleAvatar(child: Icon(Icons.camera),)),
              ),

              Expanded(
                child: GestureDetector(
                    onTap: (){
                      //here we calling function of  gallery picker
                      context.read<ImagePickerBloc>().add(GalleryPicker());
                    },
                    child: CircleAvatar(child: Icon(Icons.file_copy_outlined),)),
              ),
            ],
          ):Image.file(File(state.file!.path.toString()));
        }),
      ),
    );
  }
}
