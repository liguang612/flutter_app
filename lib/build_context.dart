import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: learnBuildContext(),
    debugShowCheckedModeBanner: false,
  ));
}

class learnBuildContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(195, 38, 214, 38),
      body: Scaffold(
        backgroundColor: const Color.fromARGB(150, 230, 50, 10),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(onPressed: () {
            print(Scaffold.of(context).widget.backgroundColor);
          });
        })
      )
    );
  }
}