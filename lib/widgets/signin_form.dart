import 'package:flutter/material.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
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
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'LOGIN',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.7, 40)),
            ),
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
    );
  }

  TextField buildPassword() {
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

  TextField buildEmail() {
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
