import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'pages/login.dart';
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
  String _item = '';
  List<DropdownMenuItem> items = [
    new DropdownMenuItem(value:'asdf',child: new Text('asdf')),
    new DropdownMenuItem(value:'vvv ',child: new Text('bbb')),
    new DropdownMenuItem(value:'vs',child: new Text('sdaa')),
    new DropdownMenuItem(value:'1231',child: new Text('asd')),
  ];
  // 定义一个controller
  TextEditingController _unameController=new TextEditingController();
  TextEditingController _pnameController=new TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  GlobalKey _formKey= new GlobalKey<FormState>();
  FocusScopeNode focusScopeNode;
  void _incrementCounter() {
    // 状态的变化,通过build方法通知相应ui进行数据更新
    print(items);
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
  void initState() {
    //监听输入改变
    _unameController.addListener((){
      print(_unameController.text);
    });
    // 监听值的变化
    _pnameController.addListener((){
      print(_unameController.text);
      print(_pnameController.text);
    });
    focusNode1.addListener((){
      print(focusNode1.hasFocus);
      print('focusNode1.hasFocus');
    });
  }
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
            Padding(
              padding: EdgeInsets.all(10),
              child:Text(
                'You have pushed the button this many times:',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
              ),
            ),
            new Text("Hello world! I'm Jack. ",
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
            // Image.network(
            //   "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            //   width: 100.0,
            //   // color: Colors.green,
            //   // colorBlendMode: BlendMode.difference,
            // ),
            // RaisedButton(
            //   child: Text("normal"),
            //   onPressed: () => print('hahahah'),
            // ),
            // 自定义按钮
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              // 作为显示按钮内容的child
              child: Text("移动焦点"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                if(null == focusScopeNode){
                  focusScopeNode = FocusScope.of(context);
                }
                focusScopeNode.requestFocus(focusNode2);
              },
            ),
            // 自定义按钮
            FlatButton(
              color: Colors.green,
              highlightColor: Colors.green[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              // 作为显示按钮内容的child
              child: Text("login"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: ()=> Navigator.pushNamed(context, "login")
              ,
            ),
            TextField(
              focusNode: focusNode1,
              controller: _unameController,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)
              ),
            ),
            TextField(
              controller: _pnameController,
              focusNode: focusNode2,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
                  prefixIcon: Icon(Icons.lock)
              ),
              // 是否启用密文
              obscureText: true,
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
// 创建了一个check box和一个switch开关
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
