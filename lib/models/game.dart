class Game {
  final bool isAway;
  final String date;
  final String state;
  final String teamLogo;

  final String homeLogo;
  final String awayLogo;
  final int homeScore;
  final int awayScore;

  const Game({
    required this.isAway,
    required this.date,
    this.teamLogo = '',
    required this.state,
    this.homeLogo = '',
    this.awayLogo = '',
    this.homeScore = 0,
    this.awayScore = 0,
  });
}
