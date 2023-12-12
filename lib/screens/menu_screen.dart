import 'package:flutter/material.dart';
import 'package:animations/screens/screens.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static const String routeName = 'menu-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: [
            GridItem(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(OpacityAnimationScreen.routeName);
              },
              title: 'Opacity',
              color: Colors.purple,
            ),
            GridItem(
              onTap: () {
                Navigator.of(context).pushNamed(ScaleAnimationScreen.routeName);
              },
              title: 'Scale',
              color: Colors.red,
            ),
            GridItem(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(PositionAnimationScreen.routeName);
              },
              title: 'Position',
              color: Colors.green,
            ),
            GridItem(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(RotateAnimationScreen.routeName);
              },
              title: 'Rotation',
              color: Colors.cyan,
            ),
            GridItem(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(CompositeAnimationScreen.routeName);
              },
              title: 'Composite',
              color: Colors.grey,
            ),
            GridItem(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(PainterScreen.routeName);
              },
              title: 'Slider Painter',
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    required this.onTap,
    required this.title,
    required this.color,
    super.key,
  });

  final void Function() onTap;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
