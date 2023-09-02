import 'package:flutter/material.dart';
import 'package:glowing_indicator/glowing_progress_indicator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: GlowingProgressIndicator(progress: .8),
        ),
      ),
    );
  }
}
