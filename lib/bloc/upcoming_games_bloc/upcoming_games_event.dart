part of 'upcoming_games_bloc.dart';

@immutable
sealed class UpcomingGamesEvent {}

final class UpcomingGamesRetrieveEvent extends UpcomingGamesEvent {}

final class UpcomingGamesRefreshEvent extends UpcomingGamesEvent {}
