import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:module_16/widgets/match_class.dart';
import '../style/style.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.match});

  final MatchDetails match;

  @override
  Widget build(BuildContext context) {
    DateTime time = match.time.toDate();
    DateTime now = DateTime.now();
    Duration remainingTime = time.difference(now);
    return Scaffold(
      appBar: AppBar(
        title: Text('${match.team1} vs ${match.team2}'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        height: 150,
        decoration: containerDecoration(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 5),
              Text('${match.team1} vs ${match.team2}',style: heading1(),),
              const SizedBox(height: 8),
              Text('${match.team1Score} : ${match.team2Score} ',style: score(),),
              const SizedBox(height: 5),
              (remainingTime.isNegative && remainingTime.inMinutes < 90)
                  ? Column(
                      children: [
                        Text('Time : ${formatDuration(remainingTime)}',style: body(),)
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                            'Match time : ${DateTimeFormat.format(time, format: 'D, M j, H:i')}',style: body(),)
                      ],
                      // children: [Text('Match will start in ${match.time}')],
                    ),
              // Text('Time : '),
              const SizedBox(height: 8),
               Text('Total Time : 90 : 00',style: body(),),
            ],
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    return "${twoDigits(minutes.abs())} : ${twoDigits(seconds.abs())}";
  }
}
