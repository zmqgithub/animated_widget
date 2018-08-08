import 'package:flutter/material.dart';


class Circular extends StatefulWidget{
  final Color color;
  final double size;

  const Circular({
    Key key,
    this.color = Colors.red,
    this.size = 50.0,
  }): super(key: key);

  @override
  _Circular createState() => new _Circular();
}

class _Circular extends State<Circular> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _animation = Tween(begin: 30.0, end: -30.0).animate(_controller);
    _controller.forward();
    _controller.addListener((){
      setState(() {
      });
    });
    _controller.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }
      if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return new Transform(transform: new Matrix4.rotationZ(_animation.value*0.0174533),
      alignment: FractionalOffset.center,
      child: new Container(
        width: widget.size,
        height: widget.size,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blueGrey),
        ),
        child: new CustomPaint(
          painter: new CircleCanvas(_animation.value, widget.color),
        ),
      ),);
  }
}

class CircleCanvas extends CustomPainter{

  double animationValue;
  Color color;

  CircleCanvas(this.animationValue, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final Paint paint = new Paint()
      ..color = Colors.lightGreen
      ..style = PaintingStyle.fill;

      drawPoint(double radius){
      var path =  new Path();
      path.moveTo(size.width/2, size.height);
      path.lineTo(size.width/4, size.height/2);
      path.lineTo(3*size.width/4, size.height/2);
      path.addArc(new Offset(size.width/4, size.height/4)&new Size(size.width/2, size.height/2), 180.0*0.0174533, 180.0*0.0174533);
      canvas.drawPath(path, paint..color = color);
      canvas.drawCircle(new Offset(size.width/2, size.height/2), radius, paint..color = Colors.blue);
    }

    drawPoint(size.height/12);
  }

  @override
  bool shouldRepaint(CircleCanvas oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate.animationValue != animationValue;
    }
  }
