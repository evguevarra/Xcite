import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'SIGNUP',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.7, 40)),
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
    );
  }

  TextField buildFullName() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Full Name',
        prefixIcon: Icon(
          Icons.person_rounded,
          color: Colors.cyan,
        ),
        border: UnderlineInputBorder(),
      ),
      textInputAction: TextInputAction.done,
    );
  }

  TextField buildSignupPassword() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.cyan,
        ),
        border: UnderlineInputBorder(),
      ),
      obscureText: true,
    );
  }

  TextField buildSignupEmail() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Email address',
        prefixIcon: Icon(
          Icons.email,
          color: Colors.cyan,
        ),
        border: UnderlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }
}