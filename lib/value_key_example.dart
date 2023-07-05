import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomepage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepage createState() => _MyHomepage();
}

class _MyHomepage extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          children: [
            TextField(key: ValueKey(1)),
            TextField(key: ValueKey(2))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingButtonClicked,
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }

  void onFloatingButtonClicked() {
    setState(() {
      
    });
  }
}