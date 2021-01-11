import 'package:flutter/material.dart';
import 'package:learn_animations/animations/circleWave/circle_wave.dart';
import 'package:learn_animations/animations/polygons/polygons.dart';
import 'package:learn_animations/animations/raindrop/raindrop_placeholder.dart';

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
              color: Colors.purple,
              size: 30,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CircleWave(),
                ),
              );
            },
            title: Text(
              "Circle Wave",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: Icon(
              Icons.circle,
              color: Colors.black,
              size: 30,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RaindropPlaceholder(),
                ),
              );
            },
            title: Text(
              "Rain Drop",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: Icon(
              Icons.water_damage,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
