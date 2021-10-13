import 'package:flutter/material.dart';

class CreateTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconButton? suffixIcon;
  final bool obscure;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final VoidCallback onTap;
  final TextInputType? keyboardType;

  const CreateTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscure,
    this.validator,
    required this.onTap,
    this.keyboardType,
    required this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      readOnly: readOnly,
      onTap: () {
        onTap();
      },
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText ?? "",
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.cyan,
        ),
        suffixIcon: suffixIcon,
        // border: UnderlineInputBorder(),
      ),
      keyboardType: keyboardType,
      //textInputAction: TextInputAction.done,
    );
  }
}
