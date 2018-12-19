import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
        'new_page': (context) => NewRoute(),
        'home': (context) => MyHomePage()
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
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new RandomWords(),
            FlatButton(
              child: Text('跳转新路径'),
              textColor: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, 'new_page');
              }
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
// 创建的一个新路由
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 相当于一个新页面的框架,放title body
    return Scaffold(
      appBar: AppBar(
        title: Text('new Route')
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            new Text('This is new Route'),
            FlatButton(
              child: Text('回到首页'),
              textColor: Colors.red,
              onPressed: () {
                Navigator.pop(context, new MaterialPageRoute(builder: (context){
                  return new MyHomePage();
                }));
              }
            )
          ]
        ),
      ),
    );
  }
}
class RandomWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final word = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(word.toString()),
    );
  }
}