import 'package:flutter/material.dart';

import 'bottom/category.dart';
import 'bottom/dynamic.dart';
import 'bottom/message.dart';
import 'bottom/mine.dart';

void main() => {runApp(MyApp())};

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _index = 0;

  final List<Widget> _homeWidgets = [
    const DynamicPage(),
    const MessagePage(),
    const CategoryPage(),
    const MinePage(),
  ];

  void _onBottomNavigationBarTapped(index) {
    setState(() {
      _index = index;
    });
  }

  BottomNavigationBarItem _getBottomNavItem(
      String title, String normalIcon, String pressedIcon, int index) {
    return BottomNavigationBarItem(
      icon: _index == index
          ? Image.asset(
        pressedIcon,
        width: 32,
        height: 28,
      )
          : Image.asset(
        normalIcon,
        width: 32,
        height: 28,
      ),
      label: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text("edison")),
        body: IndexedStack(
          index: _index,
          children: _homeWidgets,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onBottomNavigationBarTapped,
          currentIndex: _index,
          items: [
            _getBottomNavItem(
                '动态', 'images/dynamic.png', 'images/dynamic-hover.png', 0),
            _getBottomNavItem(
                ' 消息', 'images/message.png', 'images/message-hover.png', 1),
            _getBottomNavItem(
                '分类浏览', 'images/category.png', 'images/category-hover.png', 2),
            _getBottomNavItem(
                '个人中心', 'images/mine.png', 'images/mine-hover.png', 3),
          ],
        ),
      )
    );
  }


}



class HelloWorld extends StatefulWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  final List _imageNames = [
    {'image': 'images/avatar.jpg', 'text': '岛上码农'},
    {'image': 'images/qrcode.jpg', 'text': '扫码关注'}
  ];
  int _index = 0;

  void _onSwitch() {
    setState(() {
      _index = (++_index) % _imageNames.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("halo world")),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 128,
              height: 128,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Image.asset(_imageNames[_index]['image']),
            ),
            Text(_imageNames[_index]['text'])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "change",
        onPressed: _onSwitch,
        child: const Icon(Icons.swap_horizontal_circle_outlined),
      ),
    );
  }
}

class CTest extends StatelessWidget {
  const CTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(50),
          decoration: const BoxDecoration(color: Colors.blue),
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(color: Colors.yellow)
          ),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(color: Colors.red),
        ),
      ],
    );
  }
}
