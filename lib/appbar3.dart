import 'package:flutter/material.dart';

List<String> titles = <String>['Sunny', 'Cloudy', 'Rainy'];

void main() {
  runApp(MaterialApp(
    home: const MyAppBar3(),
    theme: ThemeData(useMaterial3: true),
    debugShowCheckedModeBanner: false,
  ));
}

class MyAppBar3 extends StatelessWidget {
  const MyAppBar3({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabCount = 3;

    return DefaultTabController(
      initialIndex: 1,
      length: tabCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New App'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: const Icon(Icons.cloud_outlined),
              text: titles[1],
            ),
            Tab(
              icon: const Icon(Icons.sunny),
              text: titles[0],
            ),
            Tab(
              icon: const Icon(Icons.water_drop_outlined),
              text: titles[2],
            )
          ]),
        ),
        body: TabBarView(children: <Widget>[
          ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: index.isOdd ? oddItemColor : evenItemColor,
                title: Text('${titles[1]} $index'),
              );
            },
          ),
          ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: index.isOdd ? oddItemColor : evenItemColor,
                title: Text('${titles[0]} $index'),
              );
            },
          ),
          ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: index.isOdd ? oddItemColor : evenItemColor,
                title: Text('${titles[2]} $index'),
              );
            },
          ),
        ]),
      ),
    );
  }
}
