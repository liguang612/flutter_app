import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MaterialApp(
    home: Assets(),
    debugShowCheckedModeBanner: false,
  ));
}

class Assets extends StatelessWidget {
  const Assets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Wrap(
            children: <Widget>[
              Column(
                children: [
                  Wrap(
                    children: [SvgPicture.asset('assets/image1.svg')],
                  ),
                  Wrap(
                    children: [Image.asset('assets/image2.png')],
                  ),
                  Wrap(
                    children: [Image.asset('assets/image3.png')],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
