import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
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
                    'Sign up',
                    style: TextStyle(color: Colors.cyan, fontSize: 20),
                  ),
                ],
              ),
              buildFullName(),
              buildSignupEmail(),
              buildSignupPassword(),
              const SizedBox(
                height: 8,
              ),
              buildSignupButton(context),
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

  Widget buildSignupButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_key.currentState!.validate()) {
          print("Registered Successfully");
        }
      },
      child: const Text(
        'SIGNUP',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 40)),
    );
  }

  TextFormField buildFullName() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Full Name',
        prefixIcon: Icon(
          Icons.person_rounded,
          color: Colors.cyan,
        ),
        //border: UnderlineInputBorder(),
      ),
      validator: validateFullName,
      textInputAction: TextInputAction.done,
    );
  }

  TextFormField buildSignupPassword() {
    return TextFormField(
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
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
      validator: validatePassword,
    );
  }

  TextFormField buildSignupEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email address',
        prefixIcon: Icon(
          Icons.email,
          color: Colors.cyan,
        ),
      ),
      validator: validateEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }

  String? validateFullName(String? formText) {
    if (formText!.isEmpty) return 'Fullname is Required!';
    if (!RegExp(r'^[a-z A-Z]+$').hasMatch(formText)) {
      return 'Enter a valid Fullname';
    }
    return null;
  }

  String? validateEmail(String? formEmail) {
    if (formEmail!.isEmpty) return 'Email is required!';
    if (!RegExp(r'\w+@\w+\.\w+').hasMatch(formEmail)) {
      return 'Invalid Email Format';
    }
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword!.isEmpty) return 'Password is required!';
    if (!RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$').hasMatch(formPassword)) {
      return 'Password must be at least 8 characters, and must include letters and numbers';
    }
    return null;
  }
}
