import 'dart:io';

import 'package:basic_flutter_demo/views/utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDemo extends StatefulWidget {
  final String pageTitle;

  const ImagePickerDemo({super.key, required this.pageTitle});

  @override
  State<StatefulWidget> createState() => _ImagePickerDemo();
}

class _ImagePickerDemo extends State<ImagePickerDemo> {
  File? selectedImage;

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  Future pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.pageTitle),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Utility.addVerticalSpace(),
            ElevatedButton(
              onPressed: pickImageFromGallery,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Pick Image from Gallery"),
              ),
            ),
            Utility.addVerticalSpace(),
            ElevatedButton(
              onPressed: pickImageFromCamera,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Pick Image from Camera"),
              ),
            ),
            Utility.addVerticalSpace(),
            selectedImage != null
                ? Image.file(selectedImage!)
                : const Text("Please select an image!"),
          ],
        ),
      ),
    );
  }
}
