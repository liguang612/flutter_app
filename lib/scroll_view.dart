import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyScrollView(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyScrollView extends StatelessWidget {
  const MyScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: const Text('Scroll view'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(11.0),
                          height: 200,
                          width: 200,
                          color: Colors.indigo,
                        ),
                        Container(
                          margin: const EdgeInsets.all(11.0),
                          height: 200,
                          width: 200,
                          color: Colors.lightBlue,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 11.0),
                    height: 200,
                    width: 200,
                    color: Colors.black,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 11.0),
                    height: 200,
                    width: 200,
                    color: Colors.cyan,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 11.0),
                    height: 200,
                    width: 200,
                    color: Colors.deepOrange,
                  ),
                  Container(
                    margin: const EdgeInsets.all(11.0),
                    height: 200,
                    width: 200,
                    color: Colors.green,
                  )
                ],
              ),
            )));
  }
}
