import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('Quân Pro'),
          ),
          body: Column(
            children: [
              const Text('Giỏi bơi vào đây'),
              Wrap(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {},
                    child: const Text("Easyyy")
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
                    child: const Text('Mediummmmm')
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                    child: const Text('Asiannnnnnn')
                  ),
                ],
              )
            ],
          )
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}