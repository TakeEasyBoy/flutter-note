import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class StackRoute extends StatefulWidget {
  @override
  _StackRoute createState() {
    return new _StackRoute();
  }
}
class _StackRoute extends State<StackRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('stack和绝对定位'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 160.0,
              width: 560.0,
              child: new Stack(
                alignment:Alignment.center ,
//                设置expand属性的时候,需要为stack指定一个父widget,否则高度计算会溢出,从而报错
                fit: StackFit.expand, //未定位widget占满Stack整个空间
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    child: Text("I am Jack"),
                  ),
//                  stack中的没有定位的内容
                  Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
                    color: Colors.red,
                  ),
                  Positioned(
                    top: 48.0,
                    child: RaisedButton(
                      child: Text("You"),
                      onPressed: () {
                        print('clicked');
                      },
                    ),
                  )
                ],
              ),
            ),
            new SizedBox(
//              height: 460,
//              width: 460,
              child: new ConstrainedBox(
//                约束盒子,可定义最大最小宽高
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 400.0,
                ),
                child: Stack(
                  alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
                  children: <Widget>[
                    Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
                      color: Colors.red,
                    ),
                    Positioned(
                      left: 18.0,
                      child: Text("I am Jack"),
                    ),
                    Positioned(
                      top: 18.0,
                      child: Text("Your friend"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}