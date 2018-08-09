import 'package:flutter/material.dart';
import 'circular.dart';
import 'triangle.dart';
import 'square.dart';
import 'squareedge.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Animate Widget'),
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
//                new Circular(size: width/3,color: const Color(0xFF6155B7),),
//                new TriangleView(size: width/3,color: const Color(0xFF6155B7),),
//                new Square(size: width/3,color: Colors.blue,),
                new SquareEdge(size: width/4,color: Theme.of(context).accentColor,),
              ],),
          ],
        ),
      ),

    );
  }
}
