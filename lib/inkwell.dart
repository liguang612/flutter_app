import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyInkwell(),
    debugShowCheckedModeBanner: false,
    )
  );
}

class MyInkwell extends StatefulWidget {
  MyInkwell({super.key});

  @override
  State<MyInkwell> createState() => _MyInkWell();
}

class _MyInkWell extends State<MyInkwell> {
  Color colorBox = Colors.green;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GestureDetector(
              child: FloatingActionButton(onPressed: () {}, backgroundColor: Colors.amber,),
              onTap: () {},
            ),
            InkWell(
              splashColor: Colors.purple,
              child: FloatingActionButton(onPressed: () {}, backgroundColor: Colors.blue,),
              onTap: () {},
            )
          ],
        )
      )
    );
  }
}