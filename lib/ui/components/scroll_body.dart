import 'package:flutter/material.dart';

class ScrollBody extends StatelessWidget {
  final Widget child;

  const ScrollBody({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: child,
    );
  }
}
