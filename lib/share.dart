import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(MaterialApp(
    home: Shared(),
    debugShowCheckedModeBanner: false,
  ));
}

class Shared extends StatefulWidget {
  Shared({super.key});

  @override
  State<Shared> createState() => _Shared();
}

class _Shared extends State<Shared> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Chia sẻ')),
        body: Center(
          child: Column(children: [
            const Text('Bấm vào đây để chia sẻ'),
            IconButton(
                onPressed: sharePressed,
                icon: const Icon(
                  Icons.share,
                  color: Colors.redAccent,
                ))
          ]),
        ),
      ),
    );
  }

  void sharePressed() {
    String message = 'Check out';
    Share.share(message);
  }
}
