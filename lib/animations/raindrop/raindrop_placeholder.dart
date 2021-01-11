import 'package:flutter/material.dart';
import 'package:learn_animations/animations/raindrop/raindrop_animation_screen.dart';

class RaindropPlaceholder extends StatefulWidget {
  RaindropPlaceholder({Key key}) : super(key: key);

  @override
  _RaindropPlaceholderState createState() => _RaindropPlaceholderState();
}

class _RaindropPlaceholderState extends State<RaindropPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                "Rain Drop",
                style: TextStyle(
                  color: Colors.white,
                ),
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
              centerTitle: true,
            ),
            body: Center(
              child: Text(
                "Magic !!!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: RaindropAnimationScreen(
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
