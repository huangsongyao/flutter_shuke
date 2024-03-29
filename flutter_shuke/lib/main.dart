import 'package:flutter/material.dart';
import 'package:flutter_shuke/tabbar_widget/tabbar_stateful_widget.dart';
import 'package:flutter_shuke/dev_tools/abstract_tools.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '数科',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        splashColor: ColorHexTools.clearColor,
        highlightColor: ColorHexTools.clearColor,
      ),
      debugShowCheckedModeBanner: false,
      home: TabbarStatefulWidget(),
    );
  }
}
