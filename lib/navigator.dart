import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyNavigator(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyNavigator extends StatelessWidget {
  MyNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Màn hình số 1'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Navigator2()));
              },
              child: const Text('Chuyển sang màn hình khác'),
            ),
          )),
    );
  }
}

class Navigator2 extends StatelessWidget {
  const Navigator2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Màn hình số 2'),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text('trờ về màn hình cũ'),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
    ));
  }
}
