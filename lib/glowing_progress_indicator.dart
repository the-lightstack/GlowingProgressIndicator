import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class GlowingProgressIndicator extends StatelessWidget {
  const GlowingProgressIndicator(
      {super.key, required this.progress, this.child});
  final double progress;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: _OuterGlowPainter(progress),
              ),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    child: CustomPaint(
                      painter: _FullCircleLeadPainter(),
                    ),
                  )),
              CustomPaint(painter: _InnerLightTubePainter(progress)),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Container(color: Colors.black.withOpacity(0))),
              Center(child: child ?? Container())
            ],
          ),
        ],
      ),
    );
  }
}

class _OuterGlowPainter extends CustomPainter {
  _OuterGlowPainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final fullCanvasRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..color = Colors.blue.shade500
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        fullCanvasRect, -.5 * pi, 2 * pi * progress, false, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _OuterGlowPainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}

class _FullCircleLeadPainter extends CustomPainter {
  _FullCircleLeadPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final fullCanvasRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = const Color.fromARGB(255, 32, 34, 53);
    canvas.drawArc(fullCanvasRect, -.5 * pi, 2 * pi, false, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _FullCircleLeadPainter oldDelegate) {
    return false;
  }
}

class _InnerLightTubePainter extends CustomPainter {
  _InnerLightTubePainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final fullCanvasRect = Rect.fromLTWH(0, 0, size.width, size.height);

    final whiteSmall = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..color = Colors.blue.shade100
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        fullCanvasRect, -.5 * pi, 2 * pi * progress, false, whiteSmall);
  }

  @override
  bool shouldRepaint(covariant _InnerLightTubePainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
