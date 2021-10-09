import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CreateButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed(); //signIn(emailSigninController.text, passwordSigninController.text);
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 40)),
    );
  }
}
