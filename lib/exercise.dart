import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var listTile = <Widget>[
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: Tile(),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: Tile(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: listTile, // Row nhận một list Widget nên mình truyền listTile vào
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTwoTileWidget, // thực hiện hoán đổi vị trí 2 Widget trong listTile
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }

  // hàm thực hiện hoán đổi 2 Widget trong listTile
  void swapTwoTileWidget() {
    setState(() {
      listTile.insert(1, listTile.removeAt(0));
    });
  }
}

class Tile extends StatefulWidget {
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  final Color color = generateRandomColor();
  @override
  Widget build(BuildContext context) {
    // tạm hiểu Container như cái thùng có màu sắc, kích thước => khá giống viên gạch =))
    return Container(
      color: color,
      width: 100,
      height: 100,
    );
  }
}

// hàm tạo ra một Color bất kỳ
Color generateRandomColor() {
  // biến random sẽ giúp ta tạo ra 1 số ngẫu nhiên
  final Random random = Random();

  // Màu sắc được tạo nên từ RGB, là một số ngẫu nhiên từ 0 -> 255 và opacity = 1
  return Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
}