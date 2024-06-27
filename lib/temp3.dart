import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math; // Import for random number generation

class MovingCirclesScreen2 extends StatefulWidget {
  @override
  _MovingCirclesScreen2State createState() => _MovingCirclesScreen2State();
}

class _MovingCirclesScreen2State extends State<MovingCirclesScreen2> {
  final List<double> circleYs = [
    -100.0,
    -200.0,
    -300.0,
  ];

  final double circleSpeed = 2.0;
  final double screenHeight = 1000;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        // Update circle Y positions and other state changes here
        for (int i = 0; i < circleYs.length; i++) {
          // ... your circle movement logic ...
        }

        // **Missing line:** This line tells Flutter to rebuild the UI with the updated state
        // after modifications within setState
        // Rebuild the widget tree based on the new state
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
          for (int i = 0;
              i < circleYs.length;
              i++) // Efficiently create circles
            AnimatedPositioned(
              duration: Duration(milliseconds: 100),
              left: i * 100.0, // Adjust horizontal spacing
              top: circleYs[i],
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
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [centerColor, edgeColor],
          stops: [0.5, 1.0],
        ),
      ),
    );
  }
}
