import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyStack(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyStack extends StatelessWidget {
  MyStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ví dụ về stack'),
      ),
      body: Center(
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Container(
              height: 300,
              width: 400,
              color: Colors.green,
              child: const Center(
                child: Text('Top Widget: Green',
                    style: TextStyle(color: Colors.amber)),
              ),
            ),
            Positioned(
              top: 30,
              right: 20,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Middle Widget',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 20,
              child: Container(
                height: 100,
                width: 150,
                color: Colors.pink,
                child: const Center(
                  child: Text(' Bottom Widget',
                      style: TextStyle(color: Colors.purple)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
