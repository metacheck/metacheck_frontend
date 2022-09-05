import 'dart:math';

import 'package:flutter/material.dart';

class HomeBackground extends StatefulWidget {
  @override
  State<HomeBackground> createState() => _HomeBackgroundState();
}

class _HomeBackgroundState extends State<HomeBackground> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final y = 0.0;
    final x = 0.0;

    return Stack(
      children: [
        Positioned(
            top: 20 + y,
            right: (size.width / 2.8) + x,
            child: RotatedContainer(150)),
        Positioned(top: 70 + y, right: 250 / 4, child: RotatedContainer(250)),
        Positioned(
            top: size.height / 2 + y,
            right: (size.width / 2.2) + x,
            child: DonutWidget(100)),
        Positioned(
            top: size.height / 1.44 + y,
            left: (size.width / 2.2) + x,
            child: DonutWidget(100)),
        Positioned(
            bottom: 20 + y,
            right: (size.width / 1.8) + x,
            child: RotatedContainer(150)),
        Positioned(
            bottom: y, right: (250 / 4) + x, child: RotatedContainer(250)),
        Positioned(top: 150 + y, right: 200 + x, child: DonutWidget(100)),
        Positioned(
            bottom: 20 + y, right: 200 + x, child: RotatedContainer(100)),
      ],
    );
  }
}

class RotatedContainer extends StatelessWidget {
  final double side;

  RotatedContainer(this.side);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 3.12,
      child: Container(
        width: side,
        color: Theme.of(context).primaryColor.withOpacity(0.7),
        height: side,
      ),
    );
  }
}

class DonutWidget extends StatelessWidget {
  final double radius;

  DonutWidget(this.radius);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      width: radius,
      height: radius,
      child: Transform.scale(
        scale: 0.5,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
