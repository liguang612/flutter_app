import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyAppBar(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh tiêu đề'),
        actions: <Widget>[
          IconButton(
            onPressed: () {ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thông báo')));},
            icon: const Icon(Icons.notification_add)
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thêm báo thức')));
              },
            icon: const Icon(Icons.access_alarm)
          )
        ],
      ),
      body: const Center(
        child: Text('Nothing to say', style: TextStyle(color: Colors.red, fontSize: 30.0, fontFamily: 'Times New Roman', backgroundColor: Colors.yellow),)
      )
    );
  }
}