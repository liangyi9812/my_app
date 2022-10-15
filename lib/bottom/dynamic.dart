import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:my_app/Dynamic_item.dart';
import 'package:my_app/mock/DynamicMockData.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({Key? key}) : super(key: key);

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {

  List<Map<String, Object>> _listItems = [];
  int _currentPage = 1;
  static const int PAGE_SIZE = 20;


  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    _currentPage = 1;
    _requestNewItems();
  }

  void _onLoad() async {
    _currentPage += 1;
    _requestNewItems();
  }

  void _requestNewItems() async {
    List<Map<String, Object>> curList = await DynamicMockData.list(_currentPage, PAGE_SIZE);
    setState(() {
      if (_currentPage > 1) {
        _listItems += curList;
      } else {
        _listItems = curList;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        onLoad: () async {
          _onLoad();
        },
        onRefresh: () async {
          _refresh();
        },
        child: ListView.builder(
          itemCount: _listItems.length,
          itemBuilder: (context, index) {
            return DynamicItem(
              _listItems[index]['title'] as String,
              _listItems[index]['imageUrl'] as String,
              _listItems[index]['viewCount'] as int
            );
          }
        ),
      )
    );
  }

}

