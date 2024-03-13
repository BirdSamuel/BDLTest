import 'package:bdl_test/bloc/upcoming_games_bloc/upcoming_games_bloc.dart';
import 'package:bdl_test/design/styles.dart';
import 'package:bdl_test/ui/components/game_button.dart';
import 'package:bdl_test/ui/components/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Schedule extends StatelessWidget {
  final UpcomingGamesBloc _upcomingGamesBloc = UpcomingGamesBloc();

  Schedule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BDLStyles.floatingBoxPadding,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BDLStyles.floatingBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Schedule',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: BDLStyles.buttonStyle,
                    onPressed: () {
                      _upcomingGamesBloc.add(UpcomingGamesRefreshEvent());
                    },
                    child: const Icon(Icons.refresh),
                  ),
                ],
              ),
            ),
            const VerticalSpacer(),
            SizedBox(
              height: 125,
              child: BlocBuilder(
                bloc: _upcomingGamesBloc,
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case const (UpcomingGamesInitialState):
                      _upcomingGamesBloc.add(UpcomingGamesRetrieveEvent());
                      return const SizedBox.shrink();
                    case const (UpcomingGamesRetrievingState):
                      return const SizedBox(
                        width: 128,
                        height: 64,
                        child: CircularProgressIndicator.adaptive(),
                      );
                    case const (UpcomingGamesErrorState):
                      return const Text(
                        'Upcoming Schedule could not be displayed.',
                      );
                  }

                  state as UpcomingGamesRetrievedState;
                  return ListView(
                    padding: const EdgeInsets.all(4),
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0; i < state.games.length; i++) ...[
                        GameButton(
                          game: state.games[i],
                        ),
                        const HorizontalSpacerDouble(),
                      ],
                    ],
                  );
                },
              ),
            ),
            const VerticalSpacer(),
          ],
        ),
      ),
    );
  }
}
