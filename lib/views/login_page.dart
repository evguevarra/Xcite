import 'package:event_app/widgets/blob_painter.dart';
import 'package:event_app/widgets/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.cyan[100]),
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(child: SigninForm()),
          ),
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: "Register Now",
                  style: TextStyle(
                      color: Colors.cyan, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
