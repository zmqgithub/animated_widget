import 'package:flutter/material.dart';
import 'dart:math' as math;

class Triangle extends StatefulWidget{
  final Color color;
  final double size;

  const Triangle({
    Key key,
    this.color = Colors.red,
    this.size = 50.0,
  }): super(key: key);

  @override
  _Triangle createState() => new _Triangle();
}

class _Triangle extends State<Triangle> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    _animation = Tween(begin: -180.0, end: 180.0).animate(_controller);
    _controller..repeat();
//    _controller.forward();
    _controller.addListener((){
      setState(() {
      });
//      _controller.addStatusListener((status){
//        if(status == AnimationStatus.completed){
//          _controller.reverse();
//        }
//        if(status == AnimationStatus.dismissed){
//          _controller.forward();
//        }
//      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var anim = 1;
    return new Container(child: new Stack(
      children: <Widget>[

        _animWidget(_animation.value*anim, const Color(0xFFFF0000)),
        _animWidget(120+_animation.value*anim, const Color(0xFFEFFC53)),
        _animWidget(90-_animation.value*anim, const Color(0xFF00FF00)),
        _animWidget(150+_animation.value*anim, const Color(0xFF0000FF)),
        _animWidget(60-_animation.value*anim, const Color(0xFFFFFF00)),
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
        painter: new TriangleCanvas(_animation.value, color),
      ),
    ),);
}

class TriangleCanvas extends CustomPainter{

  double animationValue;
  Color color;

  TriangleCanvas(this.animationValue, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final Paint paint = new Paint()
      ..color = color.withOpacity(0.6)
      ..style = PaintingStyle.fill;
      drawTriangles(){
        var path = new Path();

//        path.moveTo(size.width/2*0, size.height/4*1);
//        path.lineTo(size.width/2*1, size.height/4*4);
//        path.lineTo(size.width/2*2, size.height/4*1);

//        canvas.drawPath(path, paint);

        canvas.drawOval(new Offset(size.width/4, size.height*0)&Size(size.width/2 +(animationValue<0?-animationValue/180:animationValue/180)*size.width/2, size.height), paint);


//        var path1 = new Path();
//        path1.moveTo(size.width/2*1, size.height/2*0);
//        path1.lineTo(size.width/2*0, size.height/4*3);
//        path1.lineTo(size.width/2*2, size.height/4*3);
//        canvas.drawPath(path1, paint..color = Colors.red);

      }
      drawTriangles();
  }

  @override
  bool shouldRepaint(TriangleCanvas oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate.animationValue != animationValue;
  }
}
