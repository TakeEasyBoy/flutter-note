import 'package:flutter/material.dart';
import'package:flutter/rendering.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) => MyHomePage(),
      },
      // 首页
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // 状态的变化,通过build方法通知相应ui进行数据更新
    setState(() {
      _counter++;
      print(_counter);
    });
  }
  // void _decrementCounter() {
  //   setState(() {
  //     _counter--;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // scaffold包含导航栏,body以及其他浮动布局元素
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.title
        ),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child:Text(
                'You have pushed the button this many times:'*4,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
              ),
            ),
            new Text("Hello world! I'm Jack. "*4,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color=Colors.greenAccent,
                decoration:TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            ),
            DefaultTextStyle(
              //1.设置文本默认样式
              style: TextStyle(
                color:Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                  Text("I am Jack",
                    style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text("normal"),
              onPressed: () => {},
            )
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
