import 'package:flutter/material.dart';
import 'package:learn_animations/animations/circleWave/circle_wave_painter.dart';

class CircleWave extends StatefulWidget {
  CircleWave({Key key}) : super(key: key);

  @override
  _CircleWaveState createState() => _CircleWaveState();
}

class _CircleWaveState extends State<CircleWave>
    with SingleTickerProviderStateMixin {
  double waveRadius = 0.0;
  double waveGap = 8.0;
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 500,
        ))
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

  setTween() {
    _animation = Tween<double>(begin: 0.0, end: waveGap).animate(_controller)
      ..addListener(() {
        setState(() {
          waveRadius = _animation.value;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setTween();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Circle Wave",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: CustomPaint(
          painter: CircleWavePainter(
            waveRadius,
          ),
          child: Container(),
        ),
      ),
    );
  }
}
