import 'package:flutter/material.dart';
import 'package:flutter_shuke/dev_tools/abstract_tools.dart';

enum ImageLocationCustomButtonType {
  imageLocationTop,
  imageLocationBottom,
  imageLocationLeft,
  imageLocationRight,
}

class ImageLocationCustomButtonWidget extends StatefulWidget {
  ImageLocationCustomButtonWidget(
      {Key key,
      @required this.title,
      @required this.iconName,
      @required this.type,
      this.offsets = 5.0,
      this.fontSize = 12,
      this.textColor = Colors.white})
      : super(key: key);

  final ImageLocationCustomButtonType type;
  final String iconName;
  final double fontSize;
  final String title;
  final double offsets;
  final Color textColor;

  @override
  _ImageLocationCustomButtonWidgetState createState() =>
      _ImageLocationCustomButtonWidgetState();
}

class _ImageLocationCustomButtonWidgetState
    extends State<ImageLocationCustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (widget.type == ImageLocationCustomButtonType.imageLocationLeft ||
          widget.type == ImageLocationCustomButtonType.imageLocationRight)
          ? Row(
          children: (widget.type ==
              ImageLocationCustomButtonType.imageLocationLeft
              ? [_iconWidget(), _marginContainer(true), _textWidget()]
              : [_textWidget(), _marginContainer(true), _iconWidget()]))
          : Column(
        children: (widget.type ==
            ImageLocationCustomButtonType.imageLocationTop
            ? [_iconWidget(), _marginContainer(false), _textWidget()]
            : [_textWidget(), _marginContainer(false), _iconWidget()]),
      ),
    );
  }

  Image _iconWidget() {
    return ImageAssetsTools.imageAssets(widget.iconName);
  }

  Container _marginContainer(bool isRow) {
    if (isRow) {
      return ContainerTools.rowMarginTainer(rowOffsets: widget.offsets);
    }
    return ContainerTools.columnMarginTainer(columnOffsets: widget.offsets);
  }

  Text _textWidget() {
    return Text(widget.title,
        style: TextStyle(fontSize: widget.fontSize, color: widget.textColor));
  }
}
