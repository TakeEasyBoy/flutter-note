import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ContainerRouter extends StatefulWidget{
  @override
  _ContainerRouter createState() {
    return new _ContainerRouter();
  }
}
class _ContainerRouter extends State<ContainerRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('container'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            new Text('container box'),
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
          ],
        ),
      ),
    );
  }
}