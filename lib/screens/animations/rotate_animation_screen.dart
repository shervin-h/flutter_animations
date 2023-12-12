import 'package:flutter/material.dart';

class RotateAnimationScreen extends StatefulWidget {
  const RotateAnimationScreen({super.key});

  static const String routeName = 'rotate-animation-screen';

  @override
  State<RotateAnimationScreen> createState() => _RotateAnimationScreenState();
}

class _RotateAnimationScreenState extends State<RotateAnimationScreen> {
  double turns = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotate Animation'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            turns += 1;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedRotation(
            turns: turns,
            duration: const Duration(seconds: 1),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(color: Colors.cyan),
            ),
          ),
        ),
      ),
    );
  }
}
