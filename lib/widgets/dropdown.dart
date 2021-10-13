import 'package:flutter/material.dart';

class CreateDropDown extends StatefulWidget {
  final String hint;
  final List<String> items;

  //final IconData? prefixIcon;
  //final FormFieldValidator<String> validator;

  const CreateDropDown({
    Key? key,
    required this.hint,
    required this.items,
    //required this.validator,
    //this.prefixIcon,
    //required this.validator,
  }) : super(key: key);

  @override
  _CreateDropDownState createState() => _CreateDropDownState();
}

class _CreateDropDownState extends State<CreateDropDown> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return buildThemeDropdown();
  }

  Widget buildThemeDropdown() {
    return SizedBox(
      height: 40,
      child: DropdownButtonFormField<String>(
        hint: Text(
          widget.hint,
        ),
        value: value,
        isExpanded: true,
        elevation: 4,
        items: widget.items.map(buildThemeItem).toList(),
        onChanged: (value) {
          setState(() {
            this.value = value;
          });
        },
      ),
    );
  }

  DropdownMenuItem<String> buildThemeItem(String item) {
    return DropdownMenuItem(
        value: item,
        child: Text(
          item,
          // style: const TextStyle(
          //   fontSize: 12,
          // ),
        ));
  }
}
