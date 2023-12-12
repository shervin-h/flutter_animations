import 'package:flutter/material.dart';

class OpacityAnimationScreen extends StatefulWidget {
  const OpacityAnimationScreen({super.key});

  static const String routeName = 'opacity-animation-screen';

  @override
  State<OpacityAnimationScreen> createState() => _OpacityAnimationScreenState();
}

class _OpacityAnimationScreenState extends State<OpacityAnimationScreen> {

  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity Animation'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = (opacity == 1) ? 0 : 1;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedOpacity(
            opacity: opacity,
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
