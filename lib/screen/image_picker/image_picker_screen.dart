import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:image_picker_bloc/bloc/image_picker/image_picker_event.dart';
import 'package:image_picker_bloc/bloc/image_picker/image_picker_state.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text('Image Picker'),),
      body: Column(
        children: [
          Center(
            child: BlocBuilder<ImagePickerBloc, ImagePickerState>(builder: (context,state){
              return state.file == null ? InkWell(
                  onTap: ()=> context.read<ImagePickerBloc>().add(CameraCapture()),
                  child: const CircleAvatar(
                    child: Icon(Icons.camera),
                  )) : Image.file(File(state.file!.path.toString()));
            }),
          ),
          const SizedBox(height: 20),
          Center(
            child: BlocBuilder<ImagePickerBloc, ImagePickerState>(builder: (context,state){
              return state.file == null ? InkWell(
                  onTap: ()=> context.read<ImagePickerBloc>().add(GalleryImagePicker()),
                  child: const CircleAvatar(
                    child: Icon(Icons.photo),
                  )) : Image.file(File(state.file!.path.toString()));
            }),
          ),
        ],
      ),
    ));
  }
}