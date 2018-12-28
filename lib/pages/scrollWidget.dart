import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class ScrollWidget extends StatefulWidget {
  @override
  _ScrollWidget createState() {
    return new _ScrollWidget();
  }
}
class _ScrollWidget extends State<ScrollWidget> {
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('scrollWidget'),
      ),
      body: new Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                //动态创建一个List<Widget>
                children: str.split("")
                //每一个字母都用一个Text显示,字体为原来的两倍
                    .map((c) => Text(c, textScaleFactor: 2.0,))
                    .toList(),
              ),
            ),
          ),
        )
    );
  }
}