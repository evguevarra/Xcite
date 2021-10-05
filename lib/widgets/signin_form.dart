import 'package:event_app/views/homepage.dart';
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

  final TextEditingController emailSigninController =
      new TextEditingController();

  final TextEditingController passwordSigninController =
      new TextEditingController();

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
              buildEmail(),
              buildPassword(),
              const SizedBox(
                height: 8,
              ),
              buildSigninButton(context),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
              Text(
                'Or Login using Social Media:',
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.grey.shade400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/fb.png",
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Image.asset(
                    "assets/images/google.png",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSigninButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        signIn(emailSigninController.text, passwordSigninController.text);
      },
      child: const Text(
        'LOGIN',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 40)),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      obscureText: !_passwordVisible,
      controller: passwordSigninController,
      validator: validatePassword,
      decoration: InputDecoration(
        labelText: "Password",
        //hintText: 'Password',
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.cyan,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: emailSigninController,
      validator: validateEmail,
      decoration: const InputDecoration(
        labelText: "Email",
        //hintText: 'Email address',
        prefixIcon: Icon(
          Icons.email,
          color: Colors.cyan,
        ),
        // border: UnderlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
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
