part of 'scores_bloc.dart';

@immutable
sealed class ScoresBlocEvent {}

final class ScoresBlocRetrieveEvent extends ScoresBlocEvent {}

final class ScoresBlocRefreshEvent extends ScoresBlocEvent {}
