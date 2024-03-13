import 'package:flutter/material.dart';

const double paddingValue = 8;

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: paddingValue,
    );
  }
}

class HorizontalSpacerDouble extends StatelessWidget {
  const HorizontalSpacerDouble({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: paddingValue * 2,
    );
  }
}

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: paddingValue,
    );
  }
}

class VerticalSpacerDouble extends StatelessWidget {
  const VerticalSpacerDouble({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: paddingValue * 2,
    );
  }
}
