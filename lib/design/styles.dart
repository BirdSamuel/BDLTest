import 'package:flutter/material.dart';

class BDLStyles {
  static const Color redColor = Color.fromARGB(255, 207, 16, 45);
  static const Color blueColor = Color.fromARGB(255, 9, 31, 63);
  static const Color goldColor = Color.fromARGB(255, 189, 150, 92);

  static const TextStyle largeTextStyle = TextStyle(
    fontSize: 72,
    color: Color.fromARGB(255, 207, 207, 207),
    shadows: [
      Shadow(
        offset: Offset(1, 1),
      ),
      Shadow(
        offset: Offset(2, 2),
      ),
    ],
  );

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: BDLStyles.blueColor,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );

  static EdgeInsets floatingBoxPadding =
      const EdgeInsets.fromLTRB(24, 16, 24, 16);

  static BoxDecoration floatingBoxDecoration = BoxDecoration(
    color: goldColor.withAlpha(128),
    border: Border.all(
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
  );

  static BoxDecoration floatingRedBoxDecoration = BoxDecoration(
    color: redColor.withAlpha(128),
    border: Border.all(
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
  );
}
