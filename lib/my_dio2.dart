import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
    home: MyDio2(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyDio2 extends StatelessWidget {
  MyDio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Dio 2 - Get and Post concurrency')),
      body: Center(
          child: GestureDetector(
        onTap: fetchData,
        child: const DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Text('Button'),
        ),
      )),
    );
  }
}

void fetchData() async {
  var dio = Dio();
  var response = await Future.wait([
    dio.get('https://blink-api.eztek.net/gateway/user/current',
        options: Options(headers: {
          "Authorization":
              "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjM1NzZFN0QyODBFM0NEMTk5OTEyNzUxMEI4MDVERjc0IiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2ODg1NDMwODYsImV4cCI6MTY4ODU0NjY4NiwiaXNzIjoiaHR0cHM6Ly9pZC10ZXN0LnRydWVjb25uZWN0LnZuIiwiY2xpZW50X2lkIjoibG9jYWxob3N0X2lkZW50aXR5Iiwic3ViIjoiYjc4OWQyNTQtN2Q5Zi00NWViLWI3MjUtZmIwMGE2ZjAzNmUyIiwiYXV0aF90aW1lIjoxNjg4NTQzMDg2LCJpZHAiOiJsb2NhbCIsIm5hbWUiOiJMZXRodWhhbmciLCJyb2xlIjpbIlNrb3J1YmFJZGVudGl0eUFkbWluQWRtaW5pc3RyYXRvciIsInJvbGVfYWdlbmN5Il0sImlhdCI6MTY4ODU0MzA4Niwic2NvcGUiOlsic2tvcnViYV9pZGVudGl0eV9hZG1pbl9hcGkiLCJyb2xlcyIsIm9wZW5pZCIsInByb2ZpbGUiLCJlbWFpbCJdfQ.oXBr3y7nXmoPGdW-aKxGlM6xnocxGtR3dMElBR5qOifv26Xd54U4BnGUkyZQUVICEuAyklcOcE2orbERzU0JTkUWhCG77CrF09mJn-uwXs71gEhsd__jv0P4mf2VN27hN7PFYdYG3U1GgWOzJ-328JmCoitiXRfIhAAoLw0DrBrib25J1nfYPHT1OCGYh_GCnj1l-5uad3kNCsJ1m3ry4rQBb8SLTl2IkyoOygv9CWPkzoh0fmHAx96liVvL7sEoUe5wQ1SpU1PuqJfTm0UO6a59P9fYNjnKr-N1_CdjX5nNQ5mdvdpAwbhmphyd3l4s2D43ae4NLS_NdZBcsyDk3Q"
        })),
    dio.post('https://blink-api.eztek.net/gateway/user/create',
        data: {
          "id": "001",
          "username": "ragnie",
          "avatar":
              "https://i.pinimg.com/736x/db/fb/36/dbfb369ad0c7688ddf7db1bf31998b87.jpg",
          "fullname": "Bùi Anh Quốc",
          "address": "Đào Xá - Đào Dương - Ân Thi - Hưng Yên",
          "major": null,
          "email": "p.lyquangk.lythedan@gmail.com",
          "phoneNumber": "0947578718",
          "type": "user"
        },
        options: Options(headers: {
          "Authorization":
              "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjM1NzZFN0QyODBFM0NEMTk5OTEyNzUxMEI4MDVERjc0IiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2ODg1NDMwODYsImV4cCI6MTY4ODU0NjY4NiwiaXNzIjoiaHR0cHM6Ly9pZC10ZXN0LnRydWVjb25uZWN0LnZuIiwiY2xpZW50X2lkIjoibG9jYWxob3N0X2lkZW50aXR5Iiwic3ViIjoiYjc4OWQyNTQtN2Q5Zi00NWViLWI3MjUtZmIwMGE2ZjAzNmUyIiwiYXV0aF90aW1lIjoxNjg4NTQzMDg2LCJpZHAiOiJsb2NhbCIsIm5hbWUiOiJMZXRodWhhbmciLCJyb2xlIjpbIlNrb3J1YmFJZGVudGl0eUFkbWluQWRtaW5pc3RyYXRvciIsInJvbGVfYWdlbmN5Il0sImlhdCI6MTY4ODU0MzA4Niwic2NvcGUiOlsic2tvcnViYV9pZGVudGl0eV9hZG1pbl9hcGkiLCJyb2xlcyIsIm9wZW5pZCIsInByb2ZpbGUiLCJlbWFpbCJdfQ.oXBr3y7nXmoPGdW-aKxGlM6xnocxGtR3dMElBR5qOifv26Xd54U4BnGUkyZQUVICEuAyklcOcE2orbERzU0JTkUWhCG77CrF09mJn-uwXs71gEhsd__jv0P4mf2VN27hN7PFYdYG3U1GgWOzJ-328JmCoitiXRfIhAAoLw0DrBrib25J1nfYPHT1OCGYh_GCnj1l-5uad3kNCsJ1m3ry4rQBb8SLTl2IkyoOygv9CWPkzoh0fmHAx96liVvL7sEoUe5wQ1SpU1PuqJfTm0UO6a59P9fYNjnKr-N1_CdjX5nNQ5mdvdpAwbhmphyd3l4s2D43ae4NLS_NdZBcsyDk3Q"
        }))
  ]);

  print(response[0].statusCode);
  print(response[0].data);
  print('');
  print(response[1].statusCode);
  print(response[1].data);
}
