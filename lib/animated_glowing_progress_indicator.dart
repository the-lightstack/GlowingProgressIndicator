import 'package:flutter/material.dart';
import 'package:glowing_indicator/glowing_progress_indicator.dart';

class AnimatedGlowingProgressIndicator extends StatefulWidget {
  const AnimatedGlowingProgressIndicator(
      {super.key, required this.progress, required this.child});
  final Widget? child;
  final double progress;

  @override
  State<AnimatedGlowingProgressIndicator> createState() =>
      _AnimatedGlowingProgressIndicatorState();
}

class _AnimatedGlowingProgressIndicatorState
    extends State<AnimatedGlowingProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        lowerBound: 0,
        upperBound: widget.progress,
        vsync: this,
        duration: const Duration(milliseconds: 400));
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedGlowingProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress > widget.progress) {
      return;
    }
    _animationController.dispose();
    _animationController = AnimationController(
        lowerBound: oldWidget.progress,
        upperBound: widget.progress,
        vsync: this,
        duration: const Duration(milliseconds: 400));
    _animationController.addListener(() {
      setState(() {});
    });

    print(
        "${_animationController.lowerBound} -> ${_animationController.upperBound}");
    _animationController.forward();
  }

  @override
  void dispose() {
    // Properly dispose the controller. This is important!
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlowingProgressIndicator(
        progress: _animationController.value, child: widget.child);
  }
}
