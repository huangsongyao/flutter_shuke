import 'package:flutter/material.dart';
import 'package:flutter_shuke/dev_tools/abstract_tools.dart';
import 'package:flutter_shuke/custom_widget/custom_button_widget/image_location_custom_button_widget.dart';

//首页整个自定义头部statefulWidget小部件
class HomepageNavigationBarWidget extends StatefulWidget {
  HomepageNavigationBarWidget({Key key, @required this.barModel})
      : super(key: key);

  final HomepageNavigationBarModel barModel;

  @override
  _HomepageNavigationBarWidgetState createState() =>
      _HomepageNavigationBarWidgetState();
}

class _HomepageNavigationBarWidgetState
    extends State<HomepageNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenTools.AppScreenContextWidths(context),
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          HomepageNavigationBarHeaderStatelessWidget(
              avatarUrlString: widget.barModel.avatarUrlString),
          HomepageHeaderCustomAssetsHeaderwidget(),
        ],
      ),
    );
  }
}

//首页自定义头部导航栏statefulWidget小部件
class HomepageNavigationBarHeaderStatelessWidget extends StatefulWidget {
  final String avatarUrlString;

  HomepageNavigationBarHeaderStatelessWidget(
      {Key key, @required this.avatarUrlString})
      : super(key: key);

  @override
  _HomepageNavigationBarHeaderStatelessWidgetState createState() =>
      _HomepageNavigationBarHeaderStatelessWidgetState();
}

class _HomepageNavigationBarHeaderStatelessWidgetState
    extends State<HomepageNavigationBarHeaderStatelessWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.0,
        margin: EdgeInsets.only(top: 45.0),
        color: Colors.black45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: ContainerTools.clipOvalNetImageContainer(
                  widget.avatarUrlString, Size(42.0, 42.0)),
            ),
            Expanded(
              child: Container(
                  color: Colors.red,
                  child: ImageLocationCustomButtonWidget(
                    type: ImageLocationCustomButtonType.imageLocationRight,
                    iconName: "explore_icon_def",
                    title: "登入领取收入预结",
                    fontSize: 15,
                    offsets: 15.0,
                  )),
            ),
            HomepageNavigationBarCustomPayStatelessWidget(),
          ],
        ));
  }
}

//总资产+我的待还statelessWidget小部件
class HomepageHeaderCustomAssetsHeaderwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HomepageHeaderCustomAssetsWidget(
              title: "总资产(￥)",
              assets: "0.00",
              showEyesButton: true,
              eyeStatus: true),
          HomepageHeaderCustomAssetsWidget(title: "我的待还(￥)", assets: "0.00"),
        ],
      ),
    );
  }
}

//我的待还&总资产 -> 自定义statefulWidget小部件
class HomepageHeaderCustomAssetsWidget extends StatefulWidget {
  final bool showEyesButton;
  final String title;
  final String assets;
  final bool eyeStatus;

  HomepageHeaderCustomAssetsWidget(
      {Key key,
      this.showEyesButton = false,
      @required this.title,
      @required this.assets,
      this.eyeStatus = false})
      : super(key: key);

  @override
  _HomepageHeaderCustomAssetsWidgetState createState() =>
      _HomepageHeaderCustomAssetsWidgetState();
}

class _HomepageHeaderCustomAssetsWidgetState
    extends State<HomepageHeaderCustomAssetsWidget> {
  bool _closedEyes;
  String _iconName;

  String get getIconName =>
      (_closedEyes == true ? "server_icon_def" : "server_icon_sel");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconName = this.getIconName;
    _closedEyes = widget.eyeStatus;
  }

  @override
  Widget build(BuildContext context) {
    return ContainerTools.boxContainer(
      _widgetSizes(context),
      Container(
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(top: 20.0, left: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.0),
            ),
            image: DecorationImage(
              image: ExactAssetImage(
                ImageAssetsTools.imageAssetsName("explore_icon_def"),
              ),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(widget.title),
                (widget.showEyesButton
                    ? Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: GestureDetector(
                          child: ImageAssetsTools.imageAssets(_iconName),
                          onTap: updateButtonStatus,
                        ),
                      )
                    : Container()),
              ],
            ),
            Container(
              color: Colors.red,
              child: Text(widget.assets),
            ),
          ],
        ),
      ),
    );
  }

  Size _widgetSizes(BuildContext context) {
    double oneWidths =
        (ScreenTools.AppScreenContextWidths(context) - 30.0) / 5.0;
    double heights = 80.0;
    return (widget.showEyesButton
        ? Size(oneWidths * 3.0, heights)
        : Size(oneWidths * 2.0, heights));
  }

  void updateButtonStatus() {
    _closedEyes = (_closedEyes == true ? false : true);
    setState(() {
      _iconName = this.getIconName;
      print(_iconName);
    });
  }
}

//扫一扫+付款码的statelessWidget小部件
class HomepageNavigationBarCustomPayStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fontSize = 9;
    return Container(
      color: Colors.blue,
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageLocationCustomButtonWidget(
                type: ImageLocationCustomButtonType.imageLocationTop,
                iconName: "im_icon_def",
                title: "扫一扫",
                fontSize: fontSize,
                offsets: 3.0,
              )
            ],
          ),
          ContainerTools.rowMarginTainer(rowOffsets: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageLocationCustomButtonWidget(
                type: ImageLocationCustomButtonType.imageLocationTop,
                iconName: "server_icon_def",
                title: "付款码",
                fontSize: fontSize,
                offsets: 3.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//头部数据模型
class HomepageNavigationBarModel {
  String avatarUrlString;
  String userName;
  String companyName;

  HomepageNavigationBarModel(
      this.avatarUrlString, this.userName, this.companyName);
}
