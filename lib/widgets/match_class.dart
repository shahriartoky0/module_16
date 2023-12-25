import 'package:cloud_firestore/cloud_firestore.dart';

class MatchDetails {
  final String team1;

  final String team2;

  final int team1Score;

  final int team2Score;

  final Timestamp time;

  MatchDetails(this.team1, this.team2, this.time, this.team1Score, this.team2Score);
}
