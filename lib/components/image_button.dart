import 'package:flutter/material.dart';
import '../styles/colors.dart';

class ImageButton extends StatelessWidget {
  final Function onPress;
  final String image;
  final String caption;
  final bool isAsset;
  final Color color;

  ImageButton(
    this.image, {
    @required this.onPress,
    @required this.caption,
    this.isAsset = true,
    this.color,
  }) : assert(onPress != null && image != null && caption != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 5 / 3,
            child: isAsset
                ? Image.asset(image, color: color)
                : Image.network(image, color: color),
          ),
          SizedBox(
            height: 7.0,
          ),
          Text(
            caption,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: shedAppBlue400),
          ),
        ],
      ),
    );
  }
}
