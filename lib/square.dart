import 'package:flutter/material.dart';
import 'dart:math' as math;

class Square extends StatefulWidget{
  final Color color;
  final double size;

  const Square({
    Key key,
    this.color = Colors.red,
    this.size = 50.0,
  }): super(key: key);

  @override
  _Triangle createState() => new _Triangle();
}

class _Triangle extends State<Square> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

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
    return new Container(child: new Stack(
      children: <Widget>[
        _animWidget(_animation.value*anim, Colors.red),
        _animWidget(90+_animation.value*anim, Colors.green),
        _animWidget(180+_animation.value*anim, Colors.blue),
        _animWidget(270+_animation.value*anim, Colors.yellow),
      ],
    ),);
  }

  Widget _animWidget(angle, color) => new Transform(transform: new Matrix4.rotationZ(angle*0.0174533),
    alignment: FractionalOffset.center,
    child: new Container(
      width: widget.size,
      height: widget.size,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.transparent),
      ),
      child: new CustomPaint(
        painter: new RectangleCanvas(_animation.value, color),
      ),
    ),);
}

class RectangleCanvas extends CustomPainter{

  double animationValue;
  Color color;

  RectangleCanvas(this.animationValue, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final Paint paint = new Paint()
      ..color = color
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;

    drawRectangle(){
      var animVal = animationValue<0?-animationValue/180:animationValue/180;

      var path = new Path();
      path.moveTo(0.0, 0.0);
      path.arcTo(new Offset(0.0, 0.0)&new Size(size.width, size.height), 180.0*0.0174533, (45.0+45*animVal)*0.0174533, true);
      path.lineTo(size.width/4+(animationValue<0?-animationValue/180:animationValue/180)*size.width/4,
          size.height/4+(animationValue<0?-animationValue/180:animationValue/180)*size.height/4);
      canvas.drawPath(path, paint..color = color);
    }
    drawRectangle();
  }

  @override
  bool shouldRepaint(RectangleCanvas oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate.animationValue != animationValue;
  }
}
