import 'dart:convert';

import 'package:bdl_test/models/game.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'upcoming_games_event.dart';
part 'upcoming_games_state.dart';

class UpcomingGamesBloc extends Bloc<UpcomingGamesEvent, UpcomingGamesState> {
  UpcomingGamesBloc() : super(UpcomingGamesInitialState()) {
    on<UpcomingGamesEvent>(_onUpcomingGamesEvent);
  }

  Future<void> _onUpcomingGamesEvent(
    UpcomingGamesEvent event,
    Emitter<UpcomingGamesState> emit,
  ) async {
    switch (event.runtimeType) {
      case const (UpcomingGamesRetrieveEvent):
        emit(UpcomingGamesRetrievingState());
        emit(await _fetchUpcomingGames());
        break;
      case const (UpcomingGamesRefreshEvent):
        emit(UpcomingGamesRetrievingState());
        emit(await _fetchUpcomingGames());
        break;
      default:
        break;
    }
  }

  Future<UpcomingGamesState> _fetchUpcomingGames() async {
    try {
      // fetch stuff
      final response = await http.get(Uri.parse(
        'https://api-web.nhle.com/v1/club-schedule-season/FLA/now',
      ));
      if (response.statusCode == 404) {
        throw Exception('404, not found');
      }

      // convert to games
      List<Game> allGames = List.empty(growable: true);

      // quick and dirty for now
      final List<dynamic> jsonGames = jsonDecode(response.body)['games'];
      // get games backwards
      for (int i = jsonGames.length - 1; i > 0; i--) {
        // only populate 20 for now
        if (allGames.length >= 20) {
          break;
        }

        // Find other team
        bool isAway = false;
        if (jsonGames[i]['awayTeam']['abbrev'] == "FLA") {
          isAway = true;
        }

        Game newGame = Game(
          isAway: isAway,
          date: jsonGames[i]['gameDate'],
          teamLogo: jsonGames[i][isAway ? 'homeTeam' : 'awayTeam']["logo"],
          state: jsonGames[i]['gameState'],
        );
        allGames.add(newGame);
      }

      // put in proper order
      allGames = allGames.reversed.toList();
      return UpcomingGamesRetrievedState(games: allGames);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching Games: $e');
      }
      return UpcomingGamesErrorState();
    }
  }
}
