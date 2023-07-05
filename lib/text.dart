import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyText(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            body: Text.rich(TextSpan(text: 'Bùi', children: <TextSpan>[
      TextSpan(
          text: ' Anh',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25)),
      TextSpan(
        text: ' Quốc',
        style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 38,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.overline,
            color: Colors.amber),
      )
    ]))));
  }
}
