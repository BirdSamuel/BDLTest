import 'package:bdl_test/bloc/scores_bloc/scores_bloc.dart';
import 'package:bdl_test/design/styles.dart';
import 'package:bdl_test/ui/components/spacer.dart';
import 'package:bdl_test/ui/components/team_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousGame extends StatefulWidget {
  const PreviousGame({super.key});

  @override
  State<PreviousGame> createState() => _PreviousGameState();
}

class _PreviousGameState extends State<PreviousGame> {
  final ScoresBloc _scoresBloc = ScoresBloc();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BDLStyles.floatingBoxPadding,
      child: Container(
        decoration: BDLStyles.floatingBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder(
            bloc: _scoresBloc,
            builder: (context, state) {
              switch (state.runtimeType) {
                case const (ScoresBlocInitialState):
                  _scoresBloc.add(ScoresBlocRetrieveEvent());
                  return const SizedBox.shrink();
                case const (ScoresBlocRetrievingState):
                  return const SizedBox(
                    width: 128,
                    height: 64,
                    child: CircularProgressIndicator.adaptive(),
                  );
                case const (ScoresBlocErrorState):
                  return const Text(
                    'Last game could not be displayed.',
                  );
              }

              state as ScoresBlocRetrievedState;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'HOME',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TeamLogo(
                            subtitle: '',
                            title: '',
                            networkLogoPath: state.game.homeLogo,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Last Game',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const VerticalSpacerDouble(),
                            Text(
                              state.game.date,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const VerticalSpacerDouble(),
                            Text(
                              '${state.game.homeScore}  -  ${state.game.awayScore}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const Text(
                            'AWAY',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TeamLogo(
                            subtitle: '',
                            title: '',
                            networkLogoPath: state.game.awayLogo,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
