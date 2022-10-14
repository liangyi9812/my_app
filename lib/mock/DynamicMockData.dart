class DynamicMockData {
  static List<Map<String, Object>> list(int page, int size) {
    return List<Map<String, Object>>.generate(size, (index) {
      return {
        'title': '标题${index + (page - 1) * size + 1}：这是一个列表标题，最多两行，多处部分将会被截取',
        'imageUrl':
        'https://cdn.allflow.cn/assets/_next/static/media/img_download_win.fc34f83d.png',
        'viewCount': 180,
      };
    });
  }
}