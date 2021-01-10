import 'package:flutter/material.dart';
import 'package:learn_animations/animations/painters/shape_painter.dart';
import 'dart:math' as maths;

class Polygons extends StatefulWidget {
  Polygons({Key key}) : super(key: key);

  @override
  _PolygonsState createState() => _PolygonsState();
}

class _PolygonsState extends State<Polygons> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  AnimationController _controller2;
  Tween<double> _rotationTween = Tween(
    begin: -maths.pi,
    end: maths.pi,
  );

  var _sides = 3.0;
  var _radius = 100.0;
  var _radians = 0.0;
  @override
  @override
  void initState() {
    super.initState();
    setAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  setAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    );

    _animation = _rotationTween.animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Polygons",
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CustomPaint(
                painter: ShapePainter(
                  _sides,
                  _radius,
                  _animation.value,
                ),
                child: Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Sides'),
            ),
            Slider(
              value: _sides,
              min: 3.0,
              max: 10.0,
              label: _sides.toInt().toString(),
              divisions: 7,
              onChanged: (value) {
                setState(() {
                  _sides = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Size'),
            ),
            Slider(
              value: _radius,
              min: 10.0,
              max: MediaQuery.of(context).size.width / 2,
              label: _radius.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  _radius = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
