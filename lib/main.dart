import 'package:flutter/material.dart';
import 'package:glowing_indicator/glowing_progress_indicator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff050a30),
            Color(0xff000c66),
            Color.fromARGB(255, 7, 7, 170),
          ], begin: Alignment.topRight)),
          child: const Center(
            child: GlowingProgressIndicator(progress: .5),
          ),
        ),
      ),
    );
  }
}
