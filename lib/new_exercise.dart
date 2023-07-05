import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Exercise1(),
    debugShowCheckedModeBanner: false,
  ));
}

class Exercise1 extends StatefulWidget {
  @override
  State<Exercise1> createState() => Exercise1State();
}
class Exercise1State extends State<Exercise1> {
  final formStateKey = GlobalKey<FormState>();
  User user = User();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formStateKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nhập tên của bạn',
                    labelText: 'Tên'
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Tên không được để trống';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    if (value != null) user.name = value;
                  }
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nhập tuổi của bạn',
                    labelText: 'Tuổi'
                  ),
                  validator: (value) {
                    if (value != null) {
                      int? age = int.tryParse(value);
                      if (age != null && age >= 18) return null;
                      if (age != null && age < 18) return 'Tuổi phải lớn hơn hoặc băng 18';
                      return 'Giá trị không hợp lệ';
                    }
                    else {
                      return 'Tuổi không được để trống';
                    }
                  },
                  onSaved: (value) {
                    if (value != null) {
                      int? age = int.tryParse(value);
                      if (age != null) user.age = age;
                    }
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: submitForm, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)), child: const Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitForm() {
    bool? b = formStateKey.currentState?.validate();

    if (b != null && b == true) {
      print('Before saving: Name: ${user.name} and Age: ${user.age}');
      formStateKey.currentState?.save();
      print('After saving: Name: ${user.name} and Age: ${user.age}');
    }
    else {
      print('Fail validation. Try again!');
    }
  }
}

class User {
  String name;
  int age;

  User({this.name = "", this.age = 0});

  String getName() {
    return name;
  }
  int getAge() {
    return age;
  }
}