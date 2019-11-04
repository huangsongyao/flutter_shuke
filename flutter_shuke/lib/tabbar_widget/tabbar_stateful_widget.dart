import 'package:flutter/material.dart';
import 'package:flutter_shuke/dev_tools/abstract_tools.dart';
import 'package:flutter_shuke/tabbar_widget/homepage_widget/homepage_widget.dart';
import 'package:flutter_shuke/tabbar_widget/user_widget/user_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shuke/tabbar_widget/web_widget/web_widget.dart';

enum TabbarPageWidgetType {
  homepage,
  im,
  server,
  explore,
  user,
}

class TabbarStatefulWidget extends StatefulWidget {
  TabbarStatefulWidget({
    Key key,
    this.index = 0,
  }) : super(key: key);

  final int index;

  @override
  _TabbarStatefulWidgetState createState() => _TabbarStatefulWidgetState(index);
}

class _TabbarStatefulWidgetState extends State<TabbarStatefulWidget> {
  int _index;
  List<BottomNavigationBarItem> _bottomNavigationBarItems;
  List<Widget> _pageWidget;
  final List<TabbarItemConfig> _defaultTabbarConfigs =
      TabbarItemConfig.defaultTabbarConfigs();

  _TabbarStatefulWidgetState(this._index);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomNavigationBarItems =
        _defaultTabbarConfigs.map((TabbarItemConfig config) {
      return config.barItem;
    }).toList();
    _pageWidget = _defaultTabbarConfigs.map((TabbarItemConfig config) {
      return config.pageWidget;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTabbarTapped,
        fixedColor: _defaultTabbarConfigs.first.hightlightTextColor,
        selectedFontSize: _defaultTabbarConfigs.first.fontSize,
        unselectedFontSize: _defaultTabbarConfigs.first.fontSize,
        //无效。。。。
//        selectedLabelStyle: TextStyle(
//            fontSize: _defaultTabbarConfigs.first.fontSize,
//            color: _defaultTabbarConfigs.first.hightlightTextColor),
//        unselectedLabelStyle: TextStyle(
//            fontSize: _defaultTabbarConfigs.first.fontSize,
//            color: _defaultTabbarConfigs.first.normalTextColor),
      ),
      body: IndexedStack(
        index: _index,
        children: _pageWidget,
      ),
    );
  }

  void onTabbarTapped(int index) {
    if (_index == index) {
      return;
    }
    setState(() {
      _index = index;
    });
  }
}

class TabbarItemConfig with ImageAssetsTools {
  final String title;
  final Color normalTextColor;
  final Color hightlightTextColor;
  final double fontSize;

  final BottomNavigationBarItem barItem;
  final Widget pageWidget;
  final TabbarPageWidgetType pageWidgetType;

  TabbarItemConfig(
      @required this.title,
      this.normalTextColor,
      this.hightlightTextColor,
      this.fontSize,
      this.barItem,
      this.pageWidgetType,
      this.pageWidget);

  factory TabbarItemConfig.config({
    @required String title,
    @required Widget normalAssets,
    @required Widget hightlightAssets,
    Color normalTextColor = DefaultTabbarConfig.normalTextColor,
    Color hightlightTextColor = DefaultTabbarConfig.hightlightTextColor,
    double fontSize = DefaultTabbarConfig.fontSize,
    TabbarPageWidgetType widgetType,
  }) =>
      TabbarItemConfig(
          title,
          normalTextColor,
          hightlightTextColor,
          fontSize,
          BottomNavigationBarItem(
              icon: normalAssets,
              activeIcon: hightlightAssets,
              title: Text(
                title,
              )),
          widgetType,
          _bottomNavigationBarPageWidget(widgetType));

  static List<TabbarItemConfig> defaultTabbarConfigs() {
    List<Map<String, Object>> configs = [
      {
        "title": "首页",
        "normalImage": ImageAssetsTools.tabbarIconFonts(0xe603),
        "hightlightImage": ImageAssetsTools.tabbarIconFonts(0xe6fb),
        "widgetType": TabbarPageWidgetType.homepage,
      },
      {
        "title": "IM",
        "normalImage": ImageAssetsTools.tabbarIconFonts(0xe73f),
        "hightlightImage": ImageAssetsTools.tabbarIconFonts(0xe6fd),
        "widgetType": TabbarPageWidgetType.im,
      },
      {
        "title": "服务",
        "normalImage": ImageAssetsTools.tabbarIconFonts(0xe626),
        "hightlightImage": ImageAssetsTools.tabbarIconFonts(0xe7e0),
        "widgetType": TabbarPageWidgetType.server,
      },
      {
        "title": "发现",
        "normalImage": ImageAssetsTools.tabbarIconFonts(0xe664),
        "hightlightImage": ImageAssetsTools.tabbarIconFonts(0xe663),
        "widgetType": TabbarPageWidgetType.explore,
      },
      {
        "title": "我的",
        "normalImage": ImageAssetsTools.tabbarIconFonts(0xe62f),
        //ImageAssetsTools.imageAssets("mine_icon_def"),
        "hightlightImage": ImageAssetsTools.tabbarIconFonts(0xe61f),
        //ImageAssetsTools.imageAssets("mine_icon_sel"),
        "widgetType": TabbarPageWidgetType.user,
      },
    ];
    List<TabbarItemConfig> tabbarConfigs =
        configs.map((Map<String, Object> value) {
      return TabbarItemConfig.config(
          title: value["title"],
          normalAssets: value["normalImage"],
          hightlightAssets: value["hightlightImage"],
          widgetType: value["widgetType"]);
    }).toList();
    return tabbarConfigs;
  }

  static Widget _bottomNavigationBarPageWidget(TabbarPageWidgetType type) {
    Map<TabbarPageWidgetType, Widget> widgets = {
      TabbarPageWidgetType.homepage: HomepageWidget(),
      TabbarPageWidgetType.user: UserWidget(
        title: "Userpage",
        body: Container(
          color: Colors.amberAccent,
        ),
      )
    };
    Widget widget = widgets[type] ??
        WebWidget(
          title: {
            TabbarPageWidgetType.im: "IMpage",
            TabbarPageWidgetType.server: "Serverpage",
            TabbarPageWidgetType.explore: "Explorepage",
          }[type],
          body: Container(
            color: {
              TabbarPageWidgetType.im: Colors.green,
              TabbarPageWidgetType.server: Colors.orange,
              TabbarPageWidgetType.explore: Colors.red
            }[type],
          ),
        );
    return widget;
  }
}

class DefaultTabbarConfig {
  static const Color normalTextColor = Color(0xFF000000);
  static const Color hightlightTextColor = Color(0xFF6167b9);
  static const double fontSize = 11;
}
