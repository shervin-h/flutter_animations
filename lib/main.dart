import 'package:animations/screens/animations/composite_animations_screen.dart';
import 'package:animations/screens/animations/opacity_animation_screen.dart';
import 'package:animations/screens/animations/position_animation_screen.dart';
import 'package:animations/screens/animations/rotate_animation_screen.dart';
import 'package:animations/screens/animations/scale_animation_screen.dart';
import 'package:animations/screens/menu_screen.dart';
import 'package:animations/screens/painters/painter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
      routes: {
        MenuScreen.routeName: (context) => const MenuScreen(),
        OpacityAnimationScreen.routeName: (context) =>
            const OpacityAnimationScreen(),
        ScaleAnimationScreen.routeName: (context) =>
            const ScaleAnimationScreen(),
        PositionAnimationScreen.routeName: (context) =>
            const PositionAnimationScreen(),
        RotateAnimationScreen.routeName: (context) =>
            const RotateAnimationScreen(),
        CompositeAnimationScreen.routeName: (context) =>
            const CompositeAnimationScreen(),
        PainterScreen.routeName: (context) => const PainterScreen(),
      },
    );
  }
}
