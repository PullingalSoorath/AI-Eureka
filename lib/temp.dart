
import 'package:flutter/material.dart';

class BlurredCircles extends StatefulWidget {
  @override
  _BlurredCirclesState createState() => _BlurredCirclesState();
}

class _BlurredCirclesState extends State<BlurredCircles> {
  List<Color> circleColors = [Colors.red, Colors.green, Colors.blue];

  void changeColor(int index) {
    setState(() {
      circleColors[index] =
          Color((circleColors[index].value + 0xFF000000) % 0xFFFFFFFF);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: RadialGradientCircle(
                    centerColor: Color.fromARGB(255, 0, 47, 255),
                    edgeColor: Colors.transparent,
                    radius: 400.0,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: RadialGradientCircle(
                    centerColor: Color.fromARGB(134, 0, 255, 247),
                    edgeColor: Colors.transparent,
                    radius: 300.0,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: RadialGradientCircle(
                    centerColor: Color.fromARGB(197, 168, 7, 255),
                    edgeColor: Colors.transparent,
                    radius: 300.0,
                  ),
                ),
              ],
            ),

            // TODO

            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: RadialGradientCircle(
                    centerColor: Colors.purple,
                    edgeColor: Colors.transparent,
                    radius: 350.0,
                  ),
                ),
                //   Align(
                //   alignment: Alignment.bottomRight,
                //   child: RadialGradientCircle(
                //     centerColor: Colors.purple,
                //     edgeColor: Colors.transparent,
                //     radius: 400.0,
                //   ),
                // ),
                Align(
                  alignment: Alignment.topLeft,
                  child: RadialGradientCircle(
                    centerColor: Color.fromARGB(137, 255, 0, 106),
                    edgeColor: Colors.transparent,
                    radius: 400.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// TODO this is the gradient widget

class RadialGradientCircle extends StatelessWidget {
  final Color centerColor;
  final Color edgeColor;
  final double radius;

  const RadialGradientCircle({
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
          stops: [0.0, 1.0], // Adjust for color distribution
        ),
      ),
    );
  }
}

// TODO temp

class GradientCircle extends StatelessWidget {
  final Color startColor;
  final Color endColor;
  final double radius;

  const GradientCircle({
    required this.startColor,
    required this.endColor,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomRight, // Adjust for desired direction
          colors: [startColor, endColor],
        ),
      ),
    );
  }
}
