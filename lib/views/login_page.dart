import 'package:event_app/widgets/blob_painter.dart';
import 'package:event_app/widgets/signin_form.dart';
import 'package:event_app/widgets/signup_form.dart';
import 'package:flutter/gestures.dart';
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
  bool isSignin = true;
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
          _buildHeader(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Card(child: isSignin ? const SigninForm() : const SignupForm()),
          ),
          _loginToSignupChanger(),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget _loginToSignupChanger() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: isSignin
                ? "Don't have an account? "
                : "Already have an account?",
            style: const TextStyle(color: Colors.grey),
          ),
          TextSpan(
            text: isSignin ? " Register Now" : " Login Now",
            style: const TextStyle(
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (isSignin) {
                  setState(() {
                    isSignin = false;
                  });
                } else {
                  setState(() {
                    isSignin = true;
                  });
                }
              },
          )
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
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
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
        ),
      ],
    );
  }
}
