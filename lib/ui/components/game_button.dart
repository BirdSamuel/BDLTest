import 'package:bdl_test/models/game.dart';
import 'package:bdl_test/ui/components/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GameButton extends StatelessWidget {
  final Game game;

  const GameButton({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(48),
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(game.date),
          const VerticalSpacer(),
          Row(
            children: [
              const Text('vs.'),
              const HorizontalSpacer(),
              // just assume svg for the sake of time
              SvgPicture.network(
                game.teamLogo,
                width: 32,
                height: 32,
              ),
            ],
          ),
          const VerticalSpacer(),
          Text(game.state),
        ],
      ),
    );
  }
}
