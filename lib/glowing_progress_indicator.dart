import 'dart:math';

import 'package:flutter/material.dart';

class GlowingProgressIndicator extends StatelessWidget {
  const GlowingProgressIndicator({super.key, required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: _CirclePainter(progress),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  _CirclePainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final fullCanvasRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..color = Colors.greenAccent;
    canvas.drawArc(
        fullCanvasRect, -.5 * pi, 2 * pi * progress, false, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _CirclePainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
