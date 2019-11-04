import 'package:flutter/material.dart';
import 'package:flutter_shuke/base_stateful_widget/base_stateful_widget.dart';

class UserWidget extends StatefulWidget {
  UserWidget({Key key, this.title, this.body}) : super(key: key);

  final String title;
  final Widget body;

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> with BaseStatefulWidget {
  @override
  Widget build(BuildContext context) {
    return basePageStatefulWidget(widget.title, widget.body);
  }
}