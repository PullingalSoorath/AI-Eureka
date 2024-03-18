import 'package:flutter/material.dart';

class ThreeDotLoading extends StatelessWidget {
  const ThreeDotLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dot(),
        SizedBox(width: 8),
        Dot(),
        SizedBox(width: 8),
        Dot(),
      ],
    );
  }
}

class Dot extends StatefulWidget {
  const Dot({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DotState createState() => _DotState();
}

class _DotState extends State<Dot> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.0, 0.7, curve: Curves.easeInOut),
        ),
      ),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.brightness == Brightness.light
              ? Colors.blue
              : Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
