import 'package:flutter/material.dart';

class PositionAnimationScreen extends StatefulWidget {
  const PositionAnimationScreen({super.key});

  static const String routeName = 'position-animation-screen';

  @override
  State<PositionAnimationScreen> createState() => _PositionAnimationScreenState();
}

class _PositionAnimationScreenState extends State<PositionAnimationScreen> {

  double left = 0;
  double top = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Position Animation'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (left + 100 < 400) {
            left += 50;
          } else {
            left = 0;
          }

          if (top + 100 < 400) {
            top += 50;
          } else {
            top = 0;
          }
          setState(() {});
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.grey.shade300,
            width: 400,
            height: 400,
            child: Stack(
              children: [
                AnimatedPositioned(
                  left: left,
                  top: top,
                  duration: const Duration(seconds: 1),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.cyan
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
