import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: Camera(),
  ));
}

class Camera extends StatefulWidget {
  Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: Center(
          child: Column(
        children: [
          Spacer(),
          ElevatedButton(
              onPressed: () {
                pickImage(ImageSource.camera);
              },
              child: Text('Take a photo')),
          Spacer(),
          ElevatedButton(
              onPressed: () {
                pickImage(ImageSource.gallery);
              },
              child: Text('Pick up from a gallery')),
          Spacer(),
          (image == null)
              ? Icon(Icons.backup_table_rounded)
              : Image.file(image!)
        ],
      )),
    );
  }
}
