import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: newHomePage(isLoading: false, counter: 0, child: center()),
    debugShowCheckedModeBanner: false,
  ));
}

class newHomePage extends StatefulWidget {
  final bool isLoading;
  final int counter;
  final Widget child;

  newHomePage({required this.isLoading, required this.counter, required this.child});

  @override
  State<newHomePage> createState() {
    return newHomePageState();
  }
}

class newHomePageState extends State<newHomePage> {
  late bool _isLoading;
  late int _counter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: newInheritedWidget(isLoading: _isLoading, counter: _counter, child: widget.child),
      floatingActionButton: FloatingActionButton(onPressed: onFloatingButtonClicked),
    );
  }

  @override
  void initState() {
    super.initState();
    _isLoading = widget.isLoading;
    _counter = widget.counter;
  }

  void onFloatingButtonClicked() {
    setState(() {
      _counter++;
      _isLoading = (_counter % 2 == 0);
    });
  }
}

class center extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Center widget');
    return Center(
      child: CounterWidget(),
    );
  }
}

class newInheritedWidget extends InheritedWidget {
  final bool isLoading;
  final int counter;
  final Widget child;

  newInheritedWidget({required this.isLoading, required this.counter, required this.child}) : super(child: child);

  @override
  bool updateShouldNotify(newInheritedWidget widget) {
    return isLoading != widget.isLoading || counter != widget.counter;
  }

  static newInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<newInheritedWidget>();
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('CounterWidget');
    final newInheritedWidget1 = newInheritedWidget.of(context);

    if (newInheritedWidget1 == null) {
      return const Text('newInheritedWidget was not found');
    }
    return newInheritedWidget1.isLoading ? const CircularProgressIndicator() : Text('${newInheritedWidget1.counter}');
  }
}