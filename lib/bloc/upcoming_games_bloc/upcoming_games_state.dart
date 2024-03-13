part of 'upcoming_games_bloc.dart';

@immutable
sealed class UpcomingGamesState {}

final class UpcomingGamesInitialState extends UpcomingGamesState {}

final class UpcomingGamesRetrievingState extends UpcomingGamesState {}

final class UpcomingGamesRetrievedState extends UpcomingGamesState {
  final List<Game> games;

  UpcomingGamesRetrievedState({required this.games});
}

final class UpcomingGamesErrorState extends UpcomingGamesState {}
