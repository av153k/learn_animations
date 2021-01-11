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
  AnimationController _sizeController;
  Animation<double> _sizeAnimation;
  AnimationController _controller2;
  Tween<double> _rotationTween = Tween(
    begin: -maths.pi,
    end: maths.pi,
  );
  Tween<double> _sizeTween = Tween(
    begin: 0.0,
    end: 200.0,
  );

  var _sides = 3.0;
  @override
  @override
  void initState() {
    super.initState();
    setAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  setAnimation() {
    _sizeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _sizeAnimation = _sizeTween.animate(_sizeController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _sizeController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _sizeController.forward();
        }
      });

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
    _sizeController.forward();
    _controller.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10.0,
              offset: Offset(
                10.0,
                10.0,
              ),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              color: Colors.white,
              icon: Icon(
                Icons.add,
              ),
              onPressed: () {
                setState(() {
                  _sides += 1.0;
                });
              },
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(
                Icons.remove,
              ),
              onPressed: () {
                setState(() {
                  if (_sides >= 4.0) {
                    _sides -= 1.0;
                  }
                });
              },
            )
          ],
        ),
      ),
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
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sides -> ${_sides.toInt()}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: CustomPaint(
                painter: ShapePainter(
                  _sides,
                  _sizeAnimation.value,
                  _animation.value,
                ),
                child: Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
