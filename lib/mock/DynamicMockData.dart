class DynamicMockData {
  static Future<List<Map<String, Object>>> list(int page, int size) async {
    return List<Map<String, Object>>.generate(size, (index) {
      return {
        'title': '标题${index + (page - 1) * size + 1}：这是一个列表标题，最多两行，多处部分将会被截取',
        'imageUrl': 'https://cdn.allflow.cn/assets/_next/static/media/img_download_win.fc34f83d.png',
        'viewCount': 180,
      };
    });
  }

  static List<Map<String, String>> financeGrids() {
    return [
      {'name': '信用卡还款', 'icon': 'images/grid-buttons/grid-1-1.png'},
      {'name': '借钱', 'icon': 'images/grid-buttons/grid-1-2.png'},
      {'name': '理财', 'icon': 'images/grid-buttons/grid-1-3.png'},
      {'name': '保险', 'icon': 'images/grid-buttons/grid-1-4.png'},
    ];
  }
}