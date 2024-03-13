import 'dart:convert';

import 'package:bdl_test/models/game.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'scores_event.dart';
part 'scores_state.dart';

class ScoresBloc extends Bloc<ScoresBlocEvent, ScoresBlocState> {
  ScoresBloc() : super(ScoresBlocInitialState()) {
    on<ScoresBlocEvent>(_onScoresBlocEvent);
  }
}

Future<void> _onScoresBlocEvent(
  ScoresBlocEvent event,
  Emitter<ScoresBlocState> emit,
) async {
  switch (event.runtimeType) {
    case const (ScoresBlocRetrieveEvent):
      emit(ScoresBlocRetrievingState());
      emit(await _fetchLastGamesScore());
      break;
    case const (ScoresBlocRefreshEvent):
      emit(ScoresBlocRetrievingState());
      emit(await _fetchLastGamesScore());
      break;
    default:
      break;
  }
}

Future<ScoresBlocState> _fetchLastGamesScore() async {
  try {
    // fetch stuff
    final response = await http.get(Uri.parse(
      'https://api-web.nhle.com/v1/club-schedule-season/FLA/now',
    ));
    if (response.statusCode == 404) {
      throw Exception('404, not found');
    }

    //
    final List<dynamic> games = jsonDecode(response.body)['games'];
    final DateTime today = DateTime.now();

    int lastGameIndex = 0;
    for (int i = games.length - 1; i > 0; i--) {
      DateTime gameTime = DateTime.parse(games[i]['gameDate']);
      if (gameTime.isAfter(today)) {
        continue;
      } else {
        lastGameIndex = i;
        break;
      }
    }

    final dynamic lastGame = games[lastGameIndex];
    return ScoresBlocRetrievedState(
      game: Game(
        isAway: lastGame['awayTeam']['abbrev'] == "FLA",
        date: lastGame['gameDate'],
        state: 'FINAL',
        homeLogo: lastGame['homeTeam']['logo'] ?? '',
        homeScore: lastGame['homeTeam']['score'] ?? 0,
        awayLogo: lastGame['awayTeam']['logo'] ?? '',
        awayScore: lastGame['awayTeam']['score'] ?? 0,
      ),
    );
  } catch (e) {
    print(e);
    return ScoresBlocErrorState();
  }
}
