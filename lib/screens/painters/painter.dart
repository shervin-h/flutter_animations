
import 'package:flutter/material.dart';

class PainterScreen extends StatelessWidget {
  const PainterScreen({super.key});

  static const String routeName = 'painter-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painter'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: CustomPaint(
            painter: SliderPainter(),
            child: const SizedBox(
              width: 400,
              height: 400,
            ),
          ),
        ),
      ),
    );
  }
}

class SliderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      const Offset(0, 10),
      const Offset(100, 10),
      Paint()
        ..color = Colors.purple
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 10,
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
