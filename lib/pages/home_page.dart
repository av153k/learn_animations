import 'package:flutter/material.dart';
import 'package:learn_animations/animations/painters/shape_painter.dart';
import 'package:learn_animations/animations/polygons/polygons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Animations"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Polygons(),
                ),
              );
            },
            title: Text(
              "Polygons",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: Icon(
              Icons.square_foot_outlined,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
