import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pick_file.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    home: MyDio(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyDio extends StatelessWidget {
  MyDio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio tutorial'),
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: postFile,
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                'Button',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      ),
    );
  }
}

void getHTTP() async {
  try {
    var response =
        await Dio().get('https://jsonplaceholder.typicode.com/todos/1');
    print(response);
  } catch (e) {
    print(e);
  }
}

Future downloadFile() async {
  Directory? directory = await getApplicationDocumentsDirectory();
  var response = await Dio().download(
      "https://filesamples.com/samples/document/txt/sample1.txt",
      '${directory.path}/file2.txt');

  print('${directory.path}');
}

void postFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );
  if (result != null) {
    File file = File(result.files.single.path ?? "");
    String fileName = file.path.split('/').last;
    String filePath = file.path;

    FormData data = FormData.fromMap({
      'key': 'cc11079fe6526ae4f770309b09ee8df6',
      'image': await MultipartFile.fromFile(filePath, filename: fileName),
    });
    var response = await Dio().post('https://api.imgbb.com/1/upload',
        data: data, onSendProgress: (int sent, int total) {
      print('$sent, $total');
    });
  } else {
    print('Result is null');
  }
}
