import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import '_data.dart';

void main() {
  runApp(const MaterialApp(
    home: DivideGroup1(),
    debugShowCheckedModeBanner: false,
  ));
}

class DivideGroup1 extends StatefulWidget {
  const DivideGroup1({super.key});

  @override
  State<DivideGroup1> createState() => _DivideGroup1();
}

class _DivideGroup1 extends State<DivideGroup1> {
  MyData newMyData = MyData();
  late Data newData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(182),
          child: Stack(children: [
            AppBar(
              centerTitle: true,
              title: const Text("Khách hàng"),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    icon: const Icon(Icons.notifications),
                  ),
                )
              ],
              backgroundColor: const Color(0xFF5D6BB8),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(43),
                      bottomRight: Radius.circular(43))),
            ),
            Positioned(
              top: 102,
              left: 25,
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                child: const SearchBar(
                  hintText: 'Tìm kiếm nhóm khách hàng',
                  leading: Icon(Icons.search),
                ),
              ),
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/customer.svg'),
                label: 'Khách hàng'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/product.svg'),
                label: 'Sản phẩm'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/task.svg'), label: 'Tác vụ'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/report.svg'), label: 'Báo cáo'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/account.svg'),
                label: 'Tài khoản'),
          ],
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewTag()));
          },
          child: const Icon(Icons.add),
        ),
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                const TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: 'Lịch',
                    ),
                    Tab(
                      text: 'Tác vụ',
                    ),
                    Tab(
                      text: 'Ghi chú',
                    )
                  ],
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.transparent,
                  ),
                  labelColor: Color.fromARGB(255, 112, 147, 229),
                  unselectedLabelColor: Colors.grey,
                  padding: EdgeInsets.only(left: 26, right: 26),
                ),
                Expanded(
                  child: TabBarView(children: <Widget>[
                    ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 32, right: 32, top: 16, bottom: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/user_avatar.svg'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      newMyData.data![index].name!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.label,
                                      color: newMyData.data![index].tagColor ==
                                              null
                                          ? Colors.amber
                                          : Color(int.tryParse(
                                                  newMyData
                                                      .data![index].tagColor!,
                                                  radix: 16) ??
                                              0xFFF44336),
                                    ),
                                    Text(
                                        '${newMyData.data![index].numberOfCustomers} thành viên')
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                    ListView.builder(itemBuilder: (context, index) {}),
                    ListView.builder(itemBuilder: (context, index) {}),
                  ]),
                ),
              ],
            )));
  }

  Future<Response> getResponse(String url) async {
    var dio = Dio();
    var response = await dio.post(url,
        data: {'page': 1, 'pageSize': 9},
        options: Options(headers: {
          'Authorization':
              'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkU2ODg1NTQyMDk4REQ4RDE0QTI5NEFFN0RFMDU0QjBFIiwidHlwIjoiYXQrand0In0.eyJuYmYiOjE2ODU1MTcyMzQsImV4cCI6MTY4NTUyMDgzNCwiaXNzIjoiaHR0cHM6Ly9pZC10ZXN0LnRydWVjb25uZWN0LnZuIiwiY2xpZW50X2lkIjoiZjhiNjg4YTdkMDFiNjU4ZGM2YzJiNjAxYjg2NzNhN2MiLCJzdWIiOiJmMTBhN2JmOS0zZDM2LTQ3ZmYtOWNmYS0yYTBhMDAyNWNmZWQiLCJhdXRoX3RpbWUiOjE2ODU0MTM0OTYsImlkcCI6ImxvY2FsIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiNzIwY0BnbWFpbC5jb20iLCJBc3BOZXQuSWRlbnRpdHkuU2VjdXJpdHlTdGFtcCI6IjRGVTZKQU5ENjc3T1VXRUhWSEM1RTVOSFpXVTJZWkU3IiwicHJlZmVycmVkX3VzZXJuYW1lIjoiQ3VzdG9tZXI3MjAiLCJuYW1lIjoiQ3VzdG9tZXI3MjAiLCJlbWFpbCI6IjcyMGNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJ1c2VyX25hbWUiOiJDdXN0b21lcjcyMCIsInNpZCI6IkU0REFFQkY4NjI2RDk5RjFDRjJFMUNBOTJGM0EzRDkwIiwiaWF0IjoxNjg1NTE3MjM0LCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiZW1haWwiLCJyb2xlcyIsIm9mZmxpbmVfYWNjZXNzIl0sImFtciI6WyJwd2QiXX0.Z6PmPk-ChiMkGukuQXEscHE0uPETbVvUfX1-gOudQIe8J5Ozf0NKDho9NbVQ3mJhYzMeNk5VvFUkO7JcG9e5KEYvYnE8nhrCd-ncz6TG3iuBMhV1z-QIJnr-fCYVq9PoIml4GKDTgNqWVtwxX6hJHuEXdxWBAt_Papxm7x6Q1r9oVEHBcNKnEKWjclE0hlagPm6JBUzABgQXkzuVGlWTY2aQuM-_aFXcUtaKBxDmc4ml_8GPJncky-SaEjM5PCpYGEzV9ImcK_4PG-15PyJ6__Xhoy_lO3MvrA8te9eZFxUteq6tAQKydTpFkcW4KBtmJu_Uu35ZA0VZsNPfghtpMA'
        }));

    return response;
  }

  void getData() async {
    final response =
        await getResponse('https://ez-cus-dev.eztek.net/api/tag/search');
    newMyData = MyData.fromJson(response.data);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
}

class NewTag extends StatefulWidget {
  NewTag({super.key});

  @override
  State<NewTag> createState() => _NewTag();
}

class _NewTag extends State<NewTag> {
  File? avatar;
  Color colorChosen = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Thêm nhóm mới',
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF5D6BB8),
          actions: <Widget>[
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Text('Lưu'))
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          toolbarHeight: 104,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 35,
                    left: MediaQuery.of(context).size.width / 2 - 42.5,
                    child: avatar == null
                        ? SvgPicture.asset(
                            'assets/user_avatar.svg',
                            width: 85,
                            height: 85,
                          )
                        : Image.file(
                            avatar!,
                            width: 85,
                            height: 85,
                          ),
                  ),
                  Positioned(
                    top: 92,
                    left: MediaQuery.of(context).size.width / 2 + 14.5,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF5D6BB8)),
                    ),
                  ),
                  Positioned(
                      top: 86,
                      left: MediaQuery.of(context).size.width / 2 + 10,
                      child: PopupMenuButton(
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                        iconSize: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onSelected: (value) {
                          if (value == '/takeAPhoto') {
                            pickImage(ImageSource.camera);
                          }
                          if (value == '/gallery') {
                            pickImage(ImageSource.gallery);
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            const PopupMenuItem(
                              enabled: false,
                              child: Text('Thay đổi ảnh hồ sơ nhóm',
                                  style: TextStyle(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF132B69))),
                            ),
                            const PopupMenuItem(
                              value: '/takeAPhoto',
                              child: Text(
                                'Chụp ảnh',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 16,
                                    color: Color(0xFF4151AC)),
                              ),
                            ),
                            const PopupMenuItem(
                              value: '/gallery',
                              child: Text(
                                'Chọn ảnh tử thư viện',
                                style: TextStyle(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 16,
                                    color: Color(0xFF4151AC)),
                              ),
                            )
                          ];
                        },
                      ))
                ],
              ),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 26, left: 25),
                  child: Text(
                    'Tên nhóm',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Noto Sans'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 26, left: 5),
                  child: Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9, left: 25, right: 26),
              child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 52,
                  child: const TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        filled: true,
                        fillColor: Color(0xFFE7EDF9),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide.none)),
                  )),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 9),
                  child: Text(
                    'Mô tả',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Noto Sans'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 9, left: 5),
                  child: Text(
                    '*',
                    style:
                        TextStyle(color: Colors.red, fontFamily: 'Noto Sans'),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9, left: 25, right: 26),
              child: SizedBox(
                  height: 106,
                  width: MediaQuery.of(context).size.width - 52,
                  child: TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFE7EDF9),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide.none)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26, left: 26, right: 26),
              child: Row(children: [
                Stack(
                  children: <Widget>[
                    SvgPicture.asset('assets/tag.svg'),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 28),
                      child: Text(
                        'Màu',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 22,
                  height: 22,
                  child: Container(color: colorChosen),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: BlockPicker(
                                pickerColor: colorChosen,
                                onColorChanged: (Color color) => setState(() {
                                  colorChosen = color;
                                }),
                              ),
                            );
                          });
                    },
                    icon: Icon(Icons.add))
              ]),
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 24, left: 26),
              child: Text(
                'Thêm khách hàng',
                style: TextStyle(
                    fontFamily: 'Noto Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF1D2476)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33),
              child: Row(children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5D6BB8),
                      fixedSize: const Size(18.33, 18.33),
                      shape: const CircleBorder()),
                  child: const Icon(Icons.add),
                ),
                const Text('   Thêm khách hàng')
              ]),
            )
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        avatar = imageTemp;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
