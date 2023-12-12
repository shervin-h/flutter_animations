import 'package:flutter/material.dart';

class CompositeAnimationScreen extends StatefulWidget {
  const CompositeAnimationScreen({super.key});

  static const String routeName = 'composite-animation-screen';

  @override
  State<CompositeAnimationScreen> createState() =>
      _CompositeAnimationScreenState();
}

class _CompositeAnimationScreenState extends State<CompositeAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<Color?> _colorAnimation;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _colorAnimation = ColorTween(begin: Colors.cyan, end: Colors.redAccent)
        .animate(_animationController);
    _opacityAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_animationController);
    _scaleAnimation = Tween(begin: 1.0, end: 2.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Composite Animation'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_animationController.status == AnimationStatus.completed) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, widget) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: Container(
                  width: 100 * _scaleAnimation.value,
                  height: 100 * _scaleAnimation.value,
                  decoration: BoxDecoration(
                    color: _colorAnimation.value,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
