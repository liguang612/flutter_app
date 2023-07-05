import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
          onPressed: () {
            final snackBar = SnackBar(content: Text('Doraemonnnnnnnnn'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Show snackbar'),
        ),
      ),
    );
  }
}