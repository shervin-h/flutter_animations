import 'dart:math' show pi, sin, cos;

import 'package:flutter/material.dart';

class PolygonScreen extends StatefulWidget {
  const PolygonScreen({super.key});

  static const String routeName = 'polygon-screen';

  @override
  State<PolygonScreen> createState() => _PolygonScreenState();
}

class _PolygonScreenState extends State<PolygonScreen>
    with TickerProviderStateMixin {
  late final AnimationController _sidesController;
  late final Animation<int> _sidesAnimation;

  late final AnimationController _radiusController;
  late final Animation<double> _radiusAnimation;

  late final AnimationController _rotationController;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _sidesController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _sidesAnimation = IntTween(
      begin: 3,
      end: 10,
    ).animate(_sidesController);

    _radiusController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _radiusAnimation = Tween(
      begin: 20.0,
      end: 400.0,
    )
        .chain(
          CurveTween(curve: Curves.bounceInOut),
        )
        .animate(_radiusController);

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: pi * 2,
    )
        .chain(
          CurveTween(curve: Curves.easeInOut),
        )
        .animate(_rotationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sidesController.repeat(reverse: true);
    _radiusController.repeat(reverse: true);
    _rotationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _sidesController.dispose();
    _radiusController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polygon Paint'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: Listenable.merge(
              [
                _sidesController,
                _radiusController,
                _rotationController,
              ],
            ),
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(_rotationAnimation.value)
                  ..rotateY(_rotationAnimation.value)
                  ..rotateZ(_rotationAnimation.value),
                child: CustomPaint(
                  painter: PolygonPainter(sides: _sidesAnimation.value),
                  child: SizedBox(
                    width: _radiusAnimation.value,
                    height: _radiusAnimation.value,
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

class PolygonPainter extends CustomPainter {
  final int sides;

  PolygonPainter({required this.sides});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / sides;
    final angles = List.generate(sides, (index) => index * angle);
    final radius = size.width / 2;

    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );

    for (final angle in angles) {
      path.lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is PolygonPainter && oldDelegate.sides != sides;
  }
}
