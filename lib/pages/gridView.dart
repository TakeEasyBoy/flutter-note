import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class GridviewRoute extends StatefulWidget {
  @override
  _GridView createState() {
    return new _GridView();
  }
}
class _GridView extends State<GridviewRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('scrollWidget'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              constraints: BoxConstraints.tightFor(width: 400.0, height: 450.0), //卡片大小
              child: new GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //纵轴三个子widget
                      childAspectRatio: 1.0 //宽高比为1时，子widget
                  ),
                  children:<Widget>[
                    Icon(Icons.ac_unit),
                    Icon(Icons.airport_shuttle),
                    Icon(Icons.all_inclusive),
                    Icon(Icons.beach_access),
                    Icon(Icons.cake),
                    Icon(Icons.free_breakfast)
                  ]
              ),
            )

          ]
        ),
      ),
    );
  }
}