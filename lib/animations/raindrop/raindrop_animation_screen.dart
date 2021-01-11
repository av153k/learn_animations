import 'package:flutter/material.dart';
import 'package:learn_animations/animations/raindrop/drop_painter.dart';
import 'package:learn_animations/animations/raindrop/hole_painter.dart';
import 'package:learn_animations/animations/raindrop/raindrop_animation.dart';

class RaindropAnimationScreen extends StatefulWidget {
  final Color color;
  RaindropAnimationScreen({
    Key key,
    this.color = Colors.orange,
  }) : super(key: key);

  @override
  _RaindropAnimationScreenState createState() =>
      _RaindropAnimationScreenState();
}

class _RaindropAnimationScreenState extends State<RaindropAnimationScreen>
    with SingleTickerProviderStateMixin {
  Size _size = Size.zero;

  AnimationController _animationController;
  RainDropAnimation _rainDropAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(
        seconds: 3,
      ),
      vsync: this,
    );
    _rainDropAnimation = RainDropAnimation(
      _animationController,
    );

    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    setState(() {
      _size = MediaQuery.of(context).size;
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: HolePainter(
              holeColor: widget.color,
              holeSize: _rainDropAnimation.holeSize.value * _size.width,
            ),
          ),
        ),
        Positioned(
          top: _rainDropAnimation.dropPosition.value * _size.height,
          left: _size.width / 2 - _rainDropAnimation.dropRadius.value / 2,
          child: SizedBox(
            width: _rainDropAnimation.dropRadius.value,
            height: _rainDropAnimation.dropRadius.value,
            child: CustomPaint(
              painter: RainDropPainter(
                visible: _rainDropAnimation.dropVisible.value,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: _rainDropAnimation.textOpacity.value,
              child: Text(
                'Raindrop Animation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
