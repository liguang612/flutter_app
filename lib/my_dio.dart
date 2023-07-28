import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
        title: const Text('Dio tutorial'),
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: postData,
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

void uploadMultipartFile() async {
  var dio = Dio();

  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    File file = File(result.files.single.path ?? "");
    String filename = file.path.split('/').last;
    String filepath = file.path;

    FormData data = FormData.fromMap({
      'key': 'cc11079fe6526ae4f770309b09ee8df6',
      'image': await MultipartFile.fromFile(filepath, filename: filename),
      'name': 'image.png'
    });

    var response = await dio.post("https://api.imgbb.com/1/upload", data: data,
        onSendProgress: (int? sent, int? total) {
      print('$sent, $total');
    });
  } else {
    print('Result is null');
  }
}

void fetchData() async {
  var dio = Dio();
  var response = await dio.get('https://ez-cus-dev.eztek.net/api/tag/search',
      options: Options(headers: {
        "Authorization":
            "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkU2ODg1NTQyMDk4REQ4RDE0QTI5NEFFN0RFMDU0QjBFIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2ODU1MTcyMzQsImV4cCI6MTY4NTUyMDgzNCwiaXNzIjoiaHR0cHM6Ly9pZC10ZXN0LnRydWVjb25uZWN0LnZuIiwiY2xpZW50X2lkIjoiZjhiNjg4YTdkMDFiNjU4ZGM2YzJiNjAxYjg2NzNhN2MiLCJzdWIiOiJmMTBhN2JmOS0zZDM2LTQ3ZmYtOWNmYS0yYTBhMDAyNWNmZWQiLCJhdXRoX3RpbWUiOjE2ODU0MTM0OTYsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiNzIwY0BnbWFpbC5jb20iLCJBc3BOZXQuSWRlbnRpdHkuU2VjdXJpdHlTdGFtcCI6IjRGVTZKQU5ENjc3T1VXRUhWSEM1RTVOSFpXVTJZWkU3IiwicHJlZmVycmVkX3VzZXJuYW1lIjoiQ3VzdG9tZXI3MjAiLCJuYW1lIjoiQ3VzdG9tZXI3MjAiLCJlbWFpbCI6IjcyMGNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJ1c2VyX25hbWUiOiJDdXN0b21lcjcyMCIsInNpZCI6IkU0REFFQkY4NjI2RDk5RjFDRjJFMUNBOTJGM0EzRDkwIiwiaWF0IjoxNjg1NTE3MjM0LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiZW1haWwiLCJyb2xlcyIsIm9mZmxpbmVfYWNjZXNzIl0sImFtciI6WyJwd2QiXX0.Z6PmPk-ChiMkGukuQXEscHE0uPETbVvUfX1-gOudQIe8J5Ozf0NKDho9NbVQ3mJhYzMeNk5VvFUkO7JcG9e5KEYvYnE8nhrCd-ncz6TG3iuBMhV1z-QIJnr-fCYVq9PoIml4GKDTgNqWVtwxX6hJHuEXdxWBAt_Papxm7x6Q1r9oVEHBcNKnEKWjclE0hlagPm6JBUzABgQXkzuVGlWTY2aQuM-_aFXcUtaKBxDmc4ml_8GPJncky-SaEjM5PCpYGEzV9ImcK_4PG-15PyJ6__Xhoy_lO3MvrA8te9eZFxUteq6tAQKydTpFkcW4KBtmJu_Uu35ZA0VZsNPfghtpMA"
      }));
  print(response.statusCode);
  print(response.data.toString());
}

void postData() async {
  var dio = Dio();
  var response = await dio.post(
    'https://ez-cus-dev.eztek.net/api/tag/search',
    options: Options(headers: {
      "Authorization":
          "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkU2ODg1NTQyMDk4REQ4RDE0QTI5NEFFN0RFMDU0QjBFIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2ODU1MTcyMzQsImV4cCI6MTY4NTUyMDgzNCwiaXNzIjoiaHR0cHM6Ly9pZC10ZXN0LnRydWVjb25uZWN0LnZuIiwiY2xpZW50X2lkIjoiZjhiNjg4YTdkMDFiNjU4ZGM2YzJiNjAxYjg2NzNhN2MiLCJzdWIiOiJmMTBhN2JmOS0zZDM2LTQ3ZmYtOWNmYS0yYTBhMDAyNWNmZWQiLCJhdXRoX3RpbWUiOjE2ODU0MTM0OTYsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiNzIwY0BnbWFpbC5jb20iLCJBc3BOZXQuSWRlbnRpdHkuU2VjdXJpdHlTdGFtcCI6IjRGVTZKQU5ENjc3T1VXRUhWSEM1RTVOSFpXVTJZWkU3IiwicHJlZmVycmVkX3VzZXJuYW1lIjoiQ3VzdG9tZXI3MjAiLCJuYW1lIjoiQ3VzdG9tZXI3MjAiLCJlbWFpbCI6IjcyMGNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJ1c2VyX25hbWUiOiJDdXN0b21lcjcyMCIsInNpZCI6IkU0REFFQkY4NjI2RDk5RjFDRjJFMUNBOTJGM0EzRDkwIiwiaWF0IjoxNjg1NTE3MjM0LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiZW1haWwiLCJyb2xlcyIsIm9mZmxpbmVfYWNjZXNzIl0sImFtciI6WyJwd2QiXX0.Z6PmPk-ChiMkGukuQXEscHE0uPETbVvUfX1-gOudQIe8J5Ozf0NKDho9NbVQ3mJhYzMeNk5VvFUkO7JcG9e5KEYvYnE8nhrCd-ncz6TG3iuBMhV1z-QIJnr-fCYVq9PoIml4GKDTgNqWVtwxX6hJHuEXdxWBAt_Papxm7x6Q1r9oVEHBcNKnEKWjclE0hlagPm6JBUzABgQXkzuVGlWTY2aQuM-_aFXcUtaKBxDmc4ml_8GPJncky-SaEjM5PCpYGEzV9ImcK_4PG-15PyJ6__Xhoy_lO3MvrA8te9eZFxUteq6tAQKydTpFkcW4KBtmJu_Uu35ZA0VZsNPfghtpMA"
    }),
    data: {"page": 1, "pageSize": 5},
  );

  Map<String, dynamic> data = response.data;
  List<Map<String, dynamic>> value =
      List<Map<String, dynamic>>.from(data['data']);

  print(value[0]['name']);
}

void putData() async {
  var dio = Dio();
  var response = await dio.put("https://jsonplaceholder.typicode.com/posts/1",
      data: {'name': 'Ragnie', 'email': 'abc@gmail.com'});

  print(response.statusCode);
  print(response.data);
}

void patchData() async {
  var dio = Dio();
  var response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
  var response2 = await dio
      .patch('https://jsonplaceholder.typicode.com/posts/1', data: {'n'});

  print(response.data);
  print(response2.data);
}
