import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/pages/login.dart';
import 'package:flutterapp/pages/container.dart';
import 'package:flutterapp/pages/basic.dart';
import 'package:flutterapp/pages/stack_c.dart';
import 'package:flutterapp/pages/scrollWidget.dart';
import 'package:flutterapp/pages/listView.dart';
import 'package:flutterapp/pages/gridView.dart';
import 'package:flutterapp/pages/costumScroll.dart';
import 'package:flutterapp/pages/testwillPopScope.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.grey[200],
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey),//定义label字体样式
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)//定义提示文本样式
        )
      ),
      routes: {
        'home': (context) => MyHomePage(),
        'login': (context) => FormTestRoute(),
        'container': (context) => ContainerRouter(),
        'basic': (context) => BasicRouter(),
        'stack': (context) => StackRoute(),
        'scroll': (context) => ScrollWidget(),
        'list': (context) => ListViewRoute(),
        'grid': (context) => GridviewRoute(),
        'costum': (context) => CustomScrollViewTestRoute(),
        'popscope': (context) => WillPopScopeTestRoute(),
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
          // 垂直水平居中
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 自定义按钮
            new FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              // 作为显示按钮内容的child
              child: Text("container box"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: ()=> Navigator.pushNamed(context, 'container'),
            ),
            new FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              // 作为显示按钮内容的child
              child: Text("basic box"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: ()=> Navigator.pushNamed(context, 'basic'),
            ),
            // 自定义按钮
            new FlatButton(
              color: Colors.green,
              highlightColor: Colors.green[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              // 作为显示按钮内容的child
              child: Text("login"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: ()=> Navigator.pushNamed(context, "login"),
            ),
            new FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              // 作为显示按钮内容的child
              child: Text("stack"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: ()=> Navigator.pushNamed(context, "stack"),
            ),
            new FlatButton(
              color: Colors.green,
              highlightColor: Colors.green[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              // 作为显示按钮内容的child
              child: Text("scroll"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: ()=> Navigator.pushNamed(context, "scroll"),
            ),
            new FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              // 作为显示按钮内容的child
              child: Text("listview"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: ()=> Navigator.pushNamed(context, "list"),
            ),
            new FlatButton(
              color: Colors.red,
              highlightColor: Colors.red[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              // 作为显示按钮内容的child
              child: Text("grid"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: ()=> Navigator.pushNamed(context, "grid"),
            ),
            new FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              // 作为显示按钮内容的child
              child: Text("costum"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: ()=> Navigator.pushNamed(context, "costum"),
            ),
            new FlatButton(
              color: Colors.green,
              highlightColor: Colors.green[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              // 作为显示按钮内容的child
              child: Text("popscope"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: ()=> Navigator.pushNamed(context, "popscope"),
            ),
          ],
        ),
      ),

    );
  }
}

