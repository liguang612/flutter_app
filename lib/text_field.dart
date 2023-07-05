import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyTextField(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: 350,
            height: 150,
            child: Column(
              children: [
                Padding (
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Tài khoản',
                    border: OutlineInputBorder(),
                  ),
                )),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mật khẩu'
                    ),
                  )
                )
              ],
            )
          )
        )
      ),
    );
  }
}