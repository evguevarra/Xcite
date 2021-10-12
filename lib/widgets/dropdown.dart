import 'package:flutter/material.dart';

class CreateDropDown extends StatefulWidget {
  final String hint;
  final List<String> items;
  const CreateDropDown({
    Key? key,
    required this.hint,
    required this.items,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(widget.hint),
          value: value,
          isExpanded: true,
          items: widget.items.map(buildThemeItem).toList(),
          onChanged: (value) {
            setState(() {
              this.value = value!;
            });
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildThemeItem(String item) {
    return DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ));
  }
}
