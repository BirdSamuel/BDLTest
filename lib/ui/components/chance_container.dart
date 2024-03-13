import 'package:bdl_test/design/styles.dart';
import 'package:bdl_test/ui/components/spacer.dart';
import 'package:flutter/material.dart';

class EventContainer extends StatelessWidget {
  final List<Widget> children;

  const EventContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BDLStyles.floatingBoxPadding,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BDLStyles.floatingRedBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Events',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: BDLStyles.buttonStyle,
                    onPressed: () {},
                    child: const Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
            ),
            const VerticalSpacer(),
            SizedBox(
              height: 125,
              child: ListView(
                padding: const EdgeInsets.all(4),
                scrollDirection: Axis.horizontal,
                children: children,
              ),
            ),
            const VerticalSpacer(),
          ],
        ),
      ),
    );
  }
}
