import 'package:flutter/material.dart';

abstract class BaseStatefulWidget {
  Scaffold basePageStatefulWidget(String title, Widget body) {
    return Scaffold(
      appBar: title == null
          ? null
          : AppBar(
              backgroundColor: Colors.cyan[23],
              title: Text(
                title,
                style: TextStyle(color: Colors.black),
              ),
            ),
      body: body,
    );
  }
}
