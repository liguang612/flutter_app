import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyGestureDetector(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyGestureDetector extends StatefulWidget {
  const MyGestureDetector({super.key});

  @override
  State<MyGestureDetector> createState() => _MyGestureDetector();
}

class _MyGestureDetector extends State<MyGestureDetector> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        child: Scaffold(
          body: Column(children: [
            Text(state ? 'Doraemonnn' : '')
          ],),
        ),
        onTap: () {
          setState(() {
            state = !state;
            print(state);
          });
        },
      ),
    );
  }
}