import 'package:flutter/material.dart';
import 'package:flutter_app/stateless_widget_sample.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(isLoading: true, counter: 1),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  final bool isLoading;
  final int counter;

  const MyHomePage({required this.isLoading, required this.counter});
  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  late bool _isLoading;
  late int _counter;

  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return Scaffold(
      body: Center(
        child: CounterWidget(isLoading: _isLoading, counter: _counter),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: onFloatingButtonClicked),
    );
  }

  @override
  void initState() {
    super.initState();
    _isLoading = widget.isLoading;
    _counter = widget.counter;
  }

  void onFloatingButtonClicked() {
    print('Button was clicked!');
    setState(() {
      _counter++;
      _isLoading = (_counter % 2 == 0);
    });
  }
}
