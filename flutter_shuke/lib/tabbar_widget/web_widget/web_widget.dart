import 'package:flutter/material.dart';
import 'package:flutter_shuke/base_stateful_widget/base_stateful_widget.dart';

class WebWidget extends StatefulWidget {
  WebWidget({Key key, this.title, this.body}) : super(key: key);
  final String title;
  final Widget body;

  @override
  _WebWidgetState createState() => _WebWidgetState();
}

class _WebWidgetState extends State<WebWidget> with BaseStatefulWidget {
  @override
  Widget build(BuildContext context) {
    return basePageStatefulWidget(widget.title, widget.body);
  }
}
