import 'package:bdl_test/design/styles.dart';
import 'package:bdl_test/ui/components/spacer.dart';
import 'package:bdl_test/ui/components/team_logo.dart';
import 'package:flutter/material.dart';

class LiveNow extends StatefulWidget {
  const LiveNow({super.key});

  @override
  State<LiveNow> createState() => _LiveNowState();
}

class _LiveNowState extends State<LiveNow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BDLStyles.floatingBoxPadding,
      child: Container(
        decoration: BDLStyles.floatingBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TeamLogo(
                subtitle: 'FLORIDA',
                title: 'PANTHERS',
                logoPath: 'assets/PanthersPrimaryLogo.png',
              ),
              Expanded(
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.live_tv),
                        Text('LIVE NOW'),
                      ],
                    ),
                    const VerticalSpacerDouble(),
                    const Text('2-0'),
                    const VerticalSpacerDouble(),
                    ElevatedButton(
                      style: BDLStyles.buttonStyle,
                      onPressed: () {},
                      child: const Text('GO'),
                    ),
                    const VerticalSpacerDouble(),
                    const Text('05:59'),
                    const Text('2nd Period'),
                  ],
                ),
              ),
              const TeamLogo(
                subtitle: 'FLORIDA',
                title: 'PANTHERS',
                logoPath: 'assets/PanthersPrimaryLogo.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
