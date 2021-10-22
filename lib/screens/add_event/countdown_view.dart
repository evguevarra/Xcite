import 'dart:async';

import 'package:event_app/models/core/event.dart';
import 'package:event_app/models/services/date_countdown.dart';
import 'package:flutter/material.dart';

class CountDownViewPage extends StatefulWidget {
  final DateTime dateTime;
  final String title;
  const CountDownViewPage({
    Key? key,
    required this.title,
    required this.dateTime,
  }) : super(key: key);

  @override
  _CountDownViewPageState createState() => _CountDownViewPageState();
}

class _CountDownViewPageState extends State<CountDownViewPage> {
  String? timeUntil;
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade200,
        title: Text(
          widget.title,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
            ),
          )
        ],
      ),
      body: Center(
        child: Text(timeUntil ?? "Loading"),
      ),
    );
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeUntil = DateCountdown().timeLeft(widget.dateTime);
      });
    });
    //   setState(() {
    //    // _timeUntil = DateCountdown().timeLeft(widget.dateTime);
    //   });
    // });
  }

  // void timeChange() {
  //   //final decrease = 1;

  //   setState(() {
  //     timeUntil = DateCountdown().timeLeft(widget.dateTime);
  //     // final seconds = duration.inSeconds - decrease;

  //     // duration = Duration(seconds: seconds);
  //   });
  // }
}
