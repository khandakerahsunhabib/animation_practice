import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double _width = 200;
  double _opacity = 0.3;
  double _radius = 4;

  late AnimationController _animationController;

  late Animation<double> _rotationAnimation;
  late Animation<AlignmentGeometry> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _alignmentAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);
  }

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
            curve: Curves.easeIn,
            duration: Duration(seconds: 1),
            builder: (context, value, child) {
              return child!;
            },
            child: GestureDetector(
              onTap: () {
                _radius = _radius == 4 ? 30 : 4;
                setState(() {});
              },
              child: Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_radius),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Click Here"),
                ),
              ),
            ),
          ),
          AlignTransition(
            alignment: _alignmentAnimation,
            child: RotationTransition(
              turns: _rotationAnimation,
              child: Container(width: 30, height: 30, color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
