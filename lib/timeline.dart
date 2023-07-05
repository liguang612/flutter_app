import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

List<String> timeTable = ['1:00PM', '1:45PM', '3:15PM', '3:30PM', '5:30PM'];
List<String> content = [
  'Check in & networking',
  'Khai mạc và tri ân Nhà tài trợ\n--------------\nChia sẻ chủ đề 01\nTỔNG QUAN VÀ XU HƯỚNG CHUYỂN DỊCH CHUỖI NHÀ THUỐC\nMr. Ngô Anh Ngọc/CEO Pharmadi\n-----------------\nChia sẻ chủ đề 02\nNẮM GIỮ VÀ TĂNG DOANH SỐ TRÊN KHÁCH HÀNG CŨ\nMr. Ngô Anh Ngọc/CEO Pharmadi',
  'Tea Break',
  'Chia sẻ chủ đề 03\nTỔNG QUAN VÀ XU HƯỚNG CHUYỂN DỊCH CHUỖI NHÀ THUỐC\nMr. Ngô Anh Ngọc/CEO Pharmadi\n--------------------\nChia sẻ chủ đề 04\nNẮM GIỮ VÀ TĂNG DOANH SỐ TRÊN KHÁCH HÀNG CŨ\nMr. Ngô Anh Ngọc/CEO Pharmadi',
  'Kết thúc chương trình'
];
void main() {
  runApp(const MaterialApp(
    home: MyTimeline(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyTimeline extends StatelessWidget {
  const MyTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            color: Colors.green,
            width: 100,
          ),
          Flexible(
            child: Timeline.tileBuilder(
              physics: NeverScrollableScrollPhysics(),
              builder: TimelineTileBuilder.fromStyle(
                contentsAlign: ContentsAlign.basic,
                oppositeContentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(timeTable[index]),
                ),
                contentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(content[index]),
                ),
                itemCount: 5,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
