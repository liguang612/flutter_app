import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

import 'timeline/timeline_tile_builder.dart';
import 'timeline/timeline_theme.dart';
import 'timeline/timelines.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Event {
  final String background;
  final String name;
  final String avatar;
  final int members;
  final String date;
  final String location;
  final String ceo;
  final List<String> schedule;
  final List<String> scheduleContents;
  final String link;

  Event(
      {required this.background,
      required this.name,
      required this.avatar,
      required this.members,
      required this.date,
      required this.location,
      required this.ceo,
      required this.schedule,
      required this.scheduleContents,
      required this.link});
}

class Home extends StatelessWidget {
  Event event = Event(
      background:
          'https://nhn.1cdn.vn/2023/06/07/photo-3-1686039000656642120162.jpg',
      name: 'Bùi Anh Quốc',
      avatar:
          'https://haycafe.vn/wp-content/uploads/2022/02/Anh-avatar-doremon-do-mat.png',
      members: 23,
      date: 'assets/Date.svg',
      location: 'assets/Location.svg',
      ceo: 'assets/ceo.svg',
      schedule: ['1:00 PM', '1:45 PM', '3:15 PM', '3:30 PM', '5:30 PM'],
      scheduleContents: [
        'Check in & networking',
        'Khai mạc và tri ân Nhà tài trợ\n--------------\nChia sẻ chủ đề 01\nTỔNG QUAN VÀ XU HƯỚNG CHUYỂN DỊCH CHUỖI NHÀ THUỐC\nMr. Ngô Anh Ngọc/CEO Pharmadi\n-----------------\nChia sẻ chủ đề 02\nNẮM GIỮ VÀ TĂNG DOANH SỐ TRÊN KHÁCH HÀNG CŨ\nMr. Ngô Anh Ngọc/CEO Pharmadi',
        'Tea Break',
        'Chia sẻ chủ đề 03\nTỔNG QUAN VÀ XU HƯỚNG CHUYỂN DỊCH CHUỖI NHÀ THUỐC\nMr. Ngô Anh Ngọc/CEO Pharmadi\n--------------------\nChia sẻ chủ đề 04\nNẮM GIỮ VÀ TĂNG DOANH SỐ TRÊN KHÁCH HÀNG CŨ\nMr. Ngô Anh Ngọc/CEO Pharmadi',
        'Kết thúc chương trình'
      ],
      link: 'dorahome.info');
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final wBackgroundImage = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/home.svg'), label: 'Thông tin'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/slideshow.svg'),
              label: 'Slideshow'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/interact.svg'),
              label: 'Tương tác'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/document.svg'), label: 'Tài liệu')
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: wBackgroundImage * 9 / 16 + 23,
              child: Stack(
                children: <Widget>[
                  Image.network(
                    event.background,
                    height: wBackgroundImage * 9 / 16,
                    width: wBackgroundImage,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 56,
                    right: 55.26,
                    child: Row(
                      children: <Widget>[
                        Text(event.name,
                            style: const TextStyle(color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(event.avatar)),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: wBackgroundImage * 9 / 16 - 23,
                    left: wBackgroundImage / 2 - 295 / 2,
                    child: Container(
                      alignment: Alignment.center,
                      width: 295,
                      height: 46,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBktExAiKMuc6QhS4XfAFyQwQDFHQBqfzAsA&usqp=CAU'),
                          ),
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://lh3.googleusercontent.com/-Fgo9y1w4Btk/Yq1FMRA6kvI/AAAAAAAA914/nHqr3w6gjcQuikkMPI54BEs7_5Sob6jFACNcBGAsYHQ/h240/xuka-1.png'),
                          ),
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/originals/d4/0e/07/d40e07b9c3e106922860500dca917cad.jpg'),
                          ),
                          Text(
                            '+${event.members - 3} tham gia',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(9)),
                            onPressed: sharePressed,
                            child: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(9),
              child: Text('Khởi nghiệp Việt Nam - chuyển đổi số thời kỳ 4.0',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: SvgPicture.asset(event.date),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          '19 June, 2023',
                          style: TextStyle(fontSize: 14, fontFamily: 'Roboto'),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Tuesday, 4:00PM - 9:00PM',
                          style: TextStyle(fontSize: 10, fontFamily: 'Roboto'),
                        ))
                  ],
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 15),
                  child: SvgPicture.asset(event.location),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Khách sạn Marriot',
                          style: TextStyle(fontSize: 14, fontFamily: 'Roboto'),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Hà Nội, Việt Nam',
                          style: TextStyle(fontSize: 10, fontFamily: 'Roboto'),
                        ))
                  ],
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 15),
                  child: SvgPicture.asset(event.ceo),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Lê Thu Hằng',
                          style: TextStyle(fontSize: 14, fontFamily: 'Roboto'),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'CEO - True Connect',
                          style: TextStyle(fontSize: 10, fontFamily: 'Roboto'),
                        ))
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 19),
              child: Text(
                'Thông tin sự kiện: ',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 4, right: 10),
              child: Text(
                'Những năm gần đây, mô hình bán lẻ chuỗi nhà thuốc đang được hình thành và phát triển mạnh mẽ. Dự kiến tới năm 2025, các chuỗi lớn (Long Châu, Pharmacity, An Khang) chiếm khoảng 16% thị phần. Ưu thế của các chuỗi lớn nằm ở Nhận diện thương hiệu tốt; Chiến lược mặt hàng đa dạng và giá thuốc cạnh tranh; triển khai đa dạng hoạt động Marketing online/offline (trade marketing); Áp dụng Công nghệ trong vận hành nhà thuốc cũng như trong chăm sóc / giữ chân khách hàng,...\nVới mong muốn đem lại những góc nhìn đa chiều, xác định yếu tố then chốt và công thức làm nên thành công trong kinh doanh Nhà Thuốc 4.0, Pharmadi và các đối tác quyết định tổ chức workshop:',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    height: 1.5,
                    letterSpacing: 0.5),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 10, top: 2),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  '"NHÂN CHUỖI NHÀ THUỐC & BÁN HÀNG ĐA KÊNH"',
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x9AFFCCBC), Color(0x0EFAFAFA)]),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(40))),
              child: SizedBox(
                  height: 850,
                  child: Column(
                    children: [
                      const Flexible(
                        flex: 1,
                        child: Text(
                          'TIMELINE CHƯƠNG TRÌNH',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Flexible(
                          flex: 15,
                          child: Timeline.tileBuilder(
                            builder: TimelineTileBuilder.fromStyle(
                              indicatorStyle: IndicatorStyle.numberDot,
                              itemCount: event.schedule.length,
                              contentsAlign: ContentsAlign.basic,
                              oppositeContentsBuilder: (context, index) =>
                                  Padding(
                                padding: const EdgeInsets.all(24),
                                child: Text(event.schedule[index]),
                              ),
                              contentsBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(24),
                                child: DecoratedBox(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(event.scheduleContents[index]),
                                  ),
                                ),
                              ),
                            ),
                            theme: TimelineThemeData(nodePosition: 0.27),
                          ))
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  void sharePressed() {
    Share.share(event.link);
  }
}
