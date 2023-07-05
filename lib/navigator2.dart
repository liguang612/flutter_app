import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyNavigator2(),
    debugShowCheckedModeBanner: false,
  ));
}

class Todo {
  final String task;

  Todo(this.task);
}

class MyNavigator2 extends StatelessWidget {
  MyNavigator2({super.key});
  final List todos =
      List<Todo>.generate(10, (index) => Todo('Công việc $index'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Danh sách tác vụ'),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(todos[index].task),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(todo: todos[index]),
                      ));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Todo todo;
  const DetailPage({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chi tiết $todo.task'),
        ),
        body: Center(
          child: Column(
            children: [Text('${todo.task}'), Text('Mô tả ${todo.task}')],
          ),
        ),
      ),
    );
  }
}
