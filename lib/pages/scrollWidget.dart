import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class ScrollWidget extends StatefulWidget {
  @override
  _ScrollWidget createState() {
    return new _ScrollWidget();
  }
}
class _ScrollWidget extends State<ScrollWidget> {
//  创建一个滚动控制器,可以获取当前的滚动位置
  ScrollController _controller = new ScrollController();
  bool isShowTopBtn = false;

  @override
  void initState() {
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && isShowTopBtn) {
        setState(() {
          isShowTopBtn = true;
        });
      } else if (_controller.offset >= 1000 && isShowTopBtn == false) {
        setState(() {
          isShowTopBtn = false;
        });
      }
    });
  }
  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('scrollWidget'),
      ),
      body: new Scrollbar(
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: 100,
          itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
          controller: _controller,
          itemBuilder: (context, index) {
            return ListTile(title: Text("$index"),);
          }
        ),
      ),
      floatingActionButton: !isShowTopBtn ? null : FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            //返回到顶部时执行动画
            _controller.animateTo(.0,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut
            );
          }
      ),
    );
  }
}