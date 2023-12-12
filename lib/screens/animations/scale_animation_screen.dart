import 'package:flutter/material.dart';

class ScaleAnimationScreen extends StatefulWidget {
  const ScaleAnimationScreen({super.key});

  static const String routeName = 'scale-animation-screen';

  @override
  State<ScaleAnimationScreen> createState() => _ScaleAnimationScreenState();
}

class _ScaleAnimationScreenState extends State<ScaleAnimationScreen> {

  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Animation'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            scale = (scale == 1) ? 2 : 1;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(seconds: 1),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.cyan
              ),
            ),
          ),
        ),
      ),
    );
  }
}
