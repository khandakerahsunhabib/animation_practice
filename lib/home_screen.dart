import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _width = 200;
  double _opacity = 0.3;
  double _radius = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (_width == 200) {
                _width = 300;
              } else {
                _width = 200;
              }
              setState(() {});
            },
            child: AnimatedContainer(
              width: _width,
              height: 200,
              duration: Duration(microseconds: 500),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(_width == 300 ? 30 : 0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_opacity == 0.3) {
                _opacity = 0.8;
              } else {
                _opacity = 0.3;
              }
              setState(() {});
            },
            child: AnimatedOpacity(
              duration: Duration(microseconds: 300),
              opacity: _opacity,
              child: Container(width: 100, height: 100, color: Colors.green),
            ),
          ),
          SizedBox(height: 20),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: _radius),
            curve: Curves.bounceIn,
            duration: Duration(seconds: 1),
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  _radius = _radius == 4 ? 30 : 4;
                  setState(() {});
                },
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(value),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Click Here"),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
