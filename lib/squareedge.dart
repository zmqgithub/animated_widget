import 'package:flutter/material.dart';
import 'dart:math' as math;

class SquareEdge extends StatefulWidget{
  final Color color;
  final double size;

  const SquareEdge({
    Key key,
    this.color = Colors.blue,
    this.size = 50.0,
  }): super(key: key);

  @override
  _SquareEdge createState() => new _SquareEdge();
}

class _SquareEdge extends State<SquareEdge> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _animation = Tween(begin: -180.0, end: 180.0).animate(_controller);
    _controller..repeat();
    _controller.addListener((){
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var anim = 1;
    return new Center(
      child: new Stack(children: <Widget>[
      _animWidget(_animation.value*anim, widget.color),
      ],),
    );
  }

  Widget _animWidget(angle, Color color) => new Transform(transform: new Matrix4.rotationZ(angle*0.0174533),
    alignment: FractionalOffset.center,
    child: new Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
          gradient: new LinearGradient(colors: [color, color.withOpacity(0.5)],
              begin: Alignment.topRight, end: Alignment.bottomLeft, tileMode: TileMode.repeated),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.all(new Radius.circular(widget.size/2*(angle<0?-angle/180:angle/180))),
        border: new Border.all(color: color, width: 1.0),
        boxShadow: [new BoxShadow(color: color.withOpacity(0.5), blurRadius: widget.size/2,spreadRadius: (angle<0?-angle/18:angle/18) )]

      ),

    ),);
}

