import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyPickFile(),
    debugShowCheckedModeBanner: false,
  ));
}

File file = File("");

class MyPickFile extends StatefulWidget {
  const MyPickFile({super.key});

  @override
  State<MyPickFile> createState() => _MyPickFile();
}

class _MyPickFile extends State<MyPickFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.file(file),
        TextButton(
            onPressed: () {
              pickfile();
            },
            child: const Text('Pick file'))
      ]),
    );
  }

  void pickfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      setState(() {
        file = File(result.files.single.path ?? "");
      });
    }
  }
}
