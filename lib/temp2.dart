import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class MovingCirclesScreen extends StatefulWidget {
  @override
  _MovingCirclesScreenState createState() => _MovingCirclesScreenState();
}

class _MovingCirclesScreenState extends State<MovingCirclesScreen> {
  double circle1Y = -100.0;
  double circle2Y = -200.0;
  double circle3Y = -300.0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        circle1Y -= 2.0;
        circle2Y -= 5.0;
        circle3Y -= 8.0;
        if (circle1Y < -100) circle1Y = 900.0;
        if (circle2Y < -100) circle2Y = 900.0;
        if (circle3Y < -100) circle3Y = 900.0;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            left: -110.0,
            top: circle1Y,
            child: Circle(
              centerColor: Colors.purple,
              edgeColor: Colors.transparent,
              radius: 350.0,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            left: 50.0,
            top: circle2Y,
            child: Circle(
              centerColor: Colors.purple,
              edgeColor: Colors.transparent,
              radius: 350.0,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            left: 250.0,
            top: circle3Y,
            child: Circle(
              centerColor: Colors.purple,
              edgeColor: Colors.transparent,
              radius: 350.0,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            left: 300.0,
            top: circle3Y,
            child: Circle(
              centerColor: Colors.purple,
              edgeColor: Colors.transparent,
              radius: 350.0,
            ),
          ),
        ],
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final Color centerColor;
  final Color edgeColor;
  final double radius;

  const Circle({
    required this.centerColor,
    required this.edgeColor,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [centerColor, edgeColor],
          stops: [0.0, 1.0],
        ),
      ),
    );
  }
}
