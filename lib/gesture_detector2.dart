import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyGestureDetector2(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyGestureDetector2 extends StatefulWidget {
  const MyGestureDetector2({super.key});

  @override
  State<MyGestureDetector2> createState() => _MyGestureDetector2();
}

class _MyGestureDetector2 extends State<MyGestureDetector2> {
  bool _isLightOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.lightbulb_outline,
                color: _isLightOn ? Colors.amber : Colors.black,
                size: 75,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isLightOn = !_isLightOn;
                });
              },
              child: Container(
                color: Colors.amber,
                padding: const EdgeInsets.all(12),
                child: Text(_isLightOn ? 'Turn off light' : 'Turn on light'),
              ),
            )
          ],
        ),
      ),
    );
  }
}