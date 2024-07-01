import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class AnimatedBg extends StatefulWidget {
  const AnimatedBg({super.key});

  @override
  State<AnimatedBg> createState() => _AnimatedBgState();
}

class _AnimatedBgState extends State<AnimatedBg> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
      ),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            spawnMaxSpeed: 50.0,
            spawnMinSpeed: 10.0,
            spawnMaxRadius: 50.0,
            spawnMinRadius: 50.0,
            particleCount: 10,
            spawnOpacity: 0.1,
            minOpacity: 0.5,
            maxOpacity: 0.5,
            baseColor: Colors.purple,
          ),
        ),
        vsync: this,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
