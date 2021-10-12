import 'package:event_app/screens/home/homepage.dart';
import 'package:event_app/widgets/blue_button.dart';
import 'package:event_app/widgets/social_login.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController emailSigninController = TextEditingController();

  final TextEditingController passwordSigninController =
      TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Sign in',
                    style: TextStyle(color: Colors.cyan, fontSize: 20),
                  ),
                ],
              ),
              CreateTextField(
                labelText: 'Email Address',
                obscure: false,
                validator: validateEmail,
                controller: emailSigninController,
                readOnly: false,
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              CreateTextField(
                labelText: 'Password',
                obscure: !_passwordVisible,
                controller: passwordSigninController,
                validator: validatePassword,
                readOnly: false,
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              CreateButton(
                text: 'LOGIN',
                onPressed: () => signIn(
                    emailSigninController.text, passwordSigninController.text),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
              const CreateSocialLogin(),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? formEmail) {
    if (formEmail!.isEmpty) return 'Email is required!';
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword!.isEmpty) return 'Password is required!';
    return null;
  }

  void signIn(String email, String password) async {
    if (_key.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(
                  msg: "Login Successful",
                  toastLength: Toast.LENGTH_SHORT,
                ),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()))
              })
          .catchError((e) {
        Fluttertoast.showToast(
          msg: e!.message,
          toastLength: Toast.LENGTH_SHORT,
        );
      });
    }
  }
}
