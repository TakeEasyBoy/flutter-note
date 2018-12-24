import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BasicRouter extends StatefulWidget {
  @override
  _BasicRouterState createState() {
    return new _BasicRouterState();
  }
}

class _BasicRouterState extends State<BasicRouter> {
  int _counter = 0;
  void _incrementCounter() {
    // 状态的变化,通过build方法通知相应ui进行数据更新
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('basic')
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100.0,
              // color: Colors.green,
              // colorBlendMode: BlendMode.difference,
            ),
            new Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'you clicked button $_counter times',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ),
            new Text("Hello world! I'm Chao. "*4,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color=Colors.green,
              ),
            ),
            RaisedButton(
              child: Text("clear times"),
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
            ),
            new SwitchAndCheckBoxTestRoute(),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() => new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,//当前状态
          onChanged:(value){
            //重新构建页面
            setState(() {
              _switchSelected=value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.green, //选中时的颜色
          onChanged:(value){
            setState(() {
              _checkboxSelected=value;
            });
          } ,
        )
      ],
    );
  }
}