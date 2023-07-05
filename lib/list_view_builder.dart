import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyListView(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Danh sách')),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  index.toString(),
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
