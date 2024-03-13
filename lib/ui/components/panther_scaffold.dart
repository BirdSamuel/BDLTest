import 'package:bdl_test/design/styles.dart';
import 'package:flutter/material.dart';

class PantherScaffold extends StatelessWidget {
  const PantherScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                color: BDLStyles.redColor,
              ),
            ),
            Expanded(
              child: Container(
                color: BDLStyles.goldColor,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                color: BDLStyles.goldColor,
              ),
            ),
            Expanded(
              child: Container(
                color: BDLStyles.redColor,
              ),
            ),
          ],
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '20',
                style: BDLStyles.largeTextStyle,
              ),
              Image.asset('assets/PanthersTertiaryLogo.png'),
              const Text(
                '24',
                style: BDLStyles.largeTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
