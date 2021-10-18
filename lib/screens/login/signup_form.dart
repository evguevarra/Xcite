import 'package:event_app/models/services/auth_services.dart';
import 'package:event_app/widgets/blue_button.dart';
import 'package:event_app/widgets/social_login.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  final TextEditingController emailSignupController = TextEditingController();
  final TextEditingController passwordSignupController =
      TextEditingController();
  final TextEditingController fullNameSignupController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
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
              CreateTextField(
                labelText: 'Full Name',
                obscure: false,
                validator: validateFullName,
                controller: fullNameSignupController,
                readOnly: false,
                prefixIcon: Icons.person_rounded,
                onTap: () {},
              ),
              CreateTextField(
                labelText: 'Email Address',
                obscure: false,
                validator: validateEmail,
                controller: emailSignupController,
                readOnly: false,
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                onTap: () {},
              ),
              CreateTextField(
                labelText: 'Password',
                obscure: !_passwordVisible,
                controller: passwordSignupController,
                validator: validatePassword,
                readOnly: false,
                onTap: () {},
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
                height: 8,
              ),
              CreateButton(
                text: 'SIGNUP',
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    context.read<AuthService>().signUp(
                          emailSignupController.text,
                          passwordSignupController.text,
                          fullNameSignupController.text,
                          context,
                        );
                  }
                },
              ),
              const CreateSocialLogin(),
            ],
          ),
        ),
      ),
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
