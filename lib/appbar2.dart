import 'package:flutter/material.dart';

final List<int> _items = List<int>.generate(51, (int index) => index);

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorSchemeSeed: Colors.grey,
      useMaterial3: true
    ),
    home: const MyAppBar2(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyAppBar2 extends StatefulWidget {
  const MyAppBar2({super.key});

  @override
  State<MyAppBar2> createState() => _MyAppBar2();
}

class _MyAppBar2 extends State<MyAppBar2> {
  bool shadowColor = false;
  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.abc))],
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null
      ),
      body: GridView.builder(
        itemCount: _items.length,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 0.5,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 2.0
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Center(
              child: Text(
                'Scroll app bar to see the Appbar in effect',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            );
          }

          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: _items[index].isOdd ? oddItemColor : evenItemColor
            ),
          );
        }
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            alignment: MainAxisAlignment.center,
            overflowSpacing: 5.0,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    shadowColor = !shadowColor;
                  });
                },
                icon: Icon(shadowColor ? Icons.visibility_off : Icons.visibility),
                label: const Text('Shadow color')
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  if (scrolledUnderElevation == null) {
                    setState(() {
                      scrolledUnderElevation = 4.0;
                    });
                  } else {
                    setState(() {
                      scrolledUnderElevation = scrolledUnderElevation! + 1.0;
                    });
                  }
                },
                child: Text('scrolledUnderElevation : ${scrolledUnderElevation ?? 'default'}')
              )
            ],
          )
        )
      ),
    );
  }
}