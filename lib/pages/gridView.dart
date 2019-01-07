import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class GridviewRoute extends StatefulWidget {
  @override
  _GridView createState() {
    return new _GridView();
  }
}
class _GridView extends State<GridviewRoute> {
  PointerEvent _event;
  String _operation = "No Gesture detected!"; //保存事件名
  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
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
              constraints: BoxConstraints.tightFor(width: 400.0, height: 250.0), //卡片大小
              child: new GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, //纵轴三个子widget
//                      crossAxisSpacing: 10,
                      childAspectRatio: 2//宽高比为1时，子widget
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
            ),
            new Listener(
              child: Container(
                margin: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                color: Colors.blue,
                width: 300.0,
                height: 150.0,
                child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white)),
              ),
              onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
              onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
              onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
            ),
            new GestureDetector(
              child: Container(
                margin: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                color: Colors.blue,
                width: 200.0,
                height: 100.0,
                child: Text(_operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () => updateText("Tap"),//点击
              onDoubleTap: () => updateText("DoubleTap"), //双击
              onLongPress: () => updateText("LongPress"), //长按
            )
          ]
        ),
      ),
    );
  }
}