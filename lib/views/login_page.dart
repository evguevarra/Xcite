import 'package:event_app/widgets/blob_painter.dart';
import 'package:event_app/widgets/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'dart:ui' as ui;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //backwardsCompatibility: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.cyan[100]),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          // const SizedBox(
          //   height: 3,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomPaint(
                size: Size(200, (180 * 1.0114942528735633).toDouble()),
                painter: RPSCustomPainter(),
              ),
            ],
          ),
          Column(
            children: const [
              Text(
                'XCITE',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.cyan,
                ),
              ),
              Text(
                'Event Countdown App',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Card(child: SigninForm())
        ],
      ),
    );
  }
}