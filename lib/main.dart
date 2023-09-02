import 'package:flutter/material.dart';
import 'package:glowing_indicator/glowing_progress_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: Center(
            child: GlowingProgressIndicator(
                progress: 4 / 6,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("4/6",
                          style: GoogleFonts.rubik(
                              textStyle: const TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))),
                      Text("TODO's",
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade300,
                                  fontWeight: FontWeight.w500)))
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
