import 'package:bdl_test/design/styles.dart';
import 'package:bdl_test/ui/components/chance_container.dart';
import 'package:bdl_test/ui/components/chance_tile.dart';
import 'package:bdl_test/ui/components/previous_game.dart';
import 'package:bdl_test/ui/components/spacer.dart';
import 'package:bdl_test/ui/components/live_now.dart';
import 'package:bdl_test/ui/components/schedule.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const LiveNow(),

          // Purchase Tickets Button
          SizedBox(
            width: 192,
            height: 64,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: BDLStyles.blueColor,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.airplane_ticket),
                  HorizontalSpacer(),
                  Text(
                    'Buy Tickets',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          const PreviousGame(),

          Schedule(),

          const EventContainer(
            children: [
              EventTile(
                game: 'Bingo',
                prize: 'Panthers Merchandise',
              ),
              HorizontalSpacer(),
              EventTile(
                game: 'Raffle for Prizes',
                prize: 'Autographed Jersey',
              ),
              HorizontalSpacer(),
              EventTile(
                game: '50/50 Raffle',
                prize: '500 Cash Prize',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
