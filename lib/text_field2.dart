import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyTextField2(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyTextField2 extends StatefulWidget {
  const MyTextField2({super.key});

  @override
  State<MyTextField2> createState() => _MyTextField2();
}

class _MyTextField2 extends State<MyTextField2> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TextField(
            controller: _controller,
            onSubmitted: (String value) async {
              await showDialog <void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thanks'),
                    content: Text('You type $value, which has length ${value.characters.length}.'),
                    actions: <Widget>[
                      TextButton(onPressed: () {Navigator.pop(context);}, child: const Text('OK'))
                    ],
                  );
                }
              );
            }
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}