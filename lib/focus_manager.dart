import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: const MyFocusManager()),
  ));
}

class MyFocusManager extends StatefulWidget {
  const MyFocusManager({super.key});

  @override
  State<MyFocusManager> createState() => _MyFocusManager();
}

class _MyFocusManager extends State<MyFocusManager> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: TextField(
            focusNode: myFocusNode,
            decoration: const InputDecoration(
              label: Text('Doraemon'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            myFocusNode.requestFocus();
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.input),
        ));
  }
}
