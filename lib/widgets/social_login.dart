import 'package:flutter/material.dart';

class CreateSocialLogin extends StatelessWidget {
  const CreateSocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
    );
  }
}
