part of 'scores_bloc.dart';

@immutable
sealed class ScoresBlocState {}

final class ScoresBlocInitialState extends ScoresBlocState {}

final class ScoresBlocRetrievingState extends ScoresBlocState {}

final class ScoresBlocRetrievedState extends ScoresBlocState {
  final Game game;

  ScoresBlocRetrievedState({required this.game});
}

final class ScoresBlocErrorState extends ScoresBlocState {}
