import 'package:flutter/material.dart';
import 'package:flutter_shuke/base_stateful_widget/base_stateful_widget.dart';
import './homepage_navigationBar_widget/homepage_navigation_bar_widget.dart';

class HomepageWidget extends StatefulWidget {
  HomepageWidget({Key key}) : super(key: key);

  @override
  _HomepageWidgetState createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget>
    with BaseStatefulWidget {
  @override
  Widget build(BuildContext context) {
    return basePageStatefulWidget(null, body());
  }

  static Widget homepageCustomHeader() {
    return HomepageNavigationBarWidget(
        barModel: HomepageNavigationBarModel(
            "http://img5.mtime.cn/mg/2019/10/31/102958.12311773_285X160X4.jpg",
            "哈特",
            null));
  }

  static Widget body() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          homepageCustomHeader(),
        ],
      ),
    );
  }
}
