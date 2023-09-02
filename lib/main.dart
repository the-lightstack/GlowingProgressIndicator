import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animated_glowing_progress_indicator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final maxTodos = 12;
  int completedTodos = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () => setState(() {
            completedTodos = (completedTodos + 1) % (maxTodos + 1);
          }),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff050a30),
            Color(0xff000c66),
            Color.fromARGB(255, 7, 7, 170),
          ], begin: Alignment.topRight)),
          child: Center(
            child: AnimatedGlowingProgressIndicator(
              // progress: completedTodos / maxTodos,

              progress: completedTodos / maxTodos,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$completedTodos",
                            style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600))),
                        Text("/$maxTodos",
                            style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w400))),
                      ],
                    ),
                    Text("TODO's",
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w500)))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
