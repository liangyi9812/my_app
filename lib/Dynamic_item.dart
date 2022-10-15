import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DynamicItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int viewCount;
  static const double ITEM_HEIGHT = 100;
  static const double TITLE_HEIGHT = 80;
  static const double MARGIN_SIZE = 10;
  const DynamicItem(this.title, this.imageUrl, this.viewCount, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(MARGIN_SIZE),
      height: ITEM_HEIGHT,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //  pic
          _cachedImage(imageUrl),
        //  desc
          Expanded(child: Container(
            margin: const EdgeInsets.only(left: MARGIN_SIZE),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleWrapper(context, title),
                _viewCountWrapper(viewCount.toString()),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _imageWrapper(String imageUrl) {
    return SizedBox(
      width: 150,
      height: ITEM_HEIGHT,
      child: Image.network(imageUrl),
    );
  }

  Widget _cachedImage(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (_, __) => Image.asset('images/image-default.png'),
      errorWidget: (_, __, ___) => Image.asset('images/image-failed.png')
    );
  }

  Widget _titleWrapper(BuildContext context, String title) {
    return Container(
      height: TITLE_HEIGHT,
      child: Text(
        this.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline6,
      ),
    );

  }

  Widget _viewCountWrapper(String count) {
    return Container(
      height: ITEM_HEIGHT - TITLE_HEIGHT,
      child: Row(
        children: [
          const Icon(
            Icons.remove_red_eye_outlined,
            size: 14.0,
            color: Colors.grey,
          ),
          const SizedBox(width: 5),
          Text(
            viewCount.toString(),
            style: const TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
        ],
      ),
    );
  }


}
