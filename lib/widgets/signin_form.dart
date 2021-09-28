import 'package:flutter/material.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const TextField(
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
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.cyan,
                ),
                border: UnderlineInputBorder(),
              ),
              obscureText: true,
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
            )
          ],
        ),
      ),
    );
  }
}
