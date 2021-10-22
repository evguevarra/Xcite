import 'dart:ui';

import 'package:event_app/provider/event_provider.dart';
import 'package:event_app/widgets/blue_button.dart';
import 'package:event_app/widgets/datetime_picker.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({Key? key}) : super(key: key);

  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final items = ['Birthday', 'Love', 'Celebration', 'Education', 'Others'];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String? value;
  //late final CreateDropDown createDropDown = createDropDown.dropDownValue as CreateDropDown;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: const Text("Add Event"),
        content: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              CreateTextField(
                prefixIcon: Icons.event,
                labelText: 'Event Name',
                obscure: false,
                readOnly: false,
                validator: validateEvent,
                controller: nameController,
                maxLength: 15,
                onTap: () {},
              ),
              const SizedBox(height: 8),
              DateTimePicker(
                validator: validateDate,
                controller: dateController,
              ),
              const SizedBox(height: 8),
              // CreateDropDown(
              //   hint: 'Select Themes',
              //   items: items,
              //   //validator: validateThemes,
              // ),
              buildThemeDropdown(),
              const SizedBox(height: 16),
              CreateButton(text: 'ADD EVENT', onPressed: () => addEvent())
            ],
          ),
        ),
      ),
    );
  }

  String? validateEvent(String? formEvent) {
    if (formEvent!.isEmpty) return 'Event Name is required!';
    return null;
  }

  String? validateDate(String? formDate) {
    if (formDate!.isEmpty) return 'Date and Time is required!';
    return null;
  }

  String? validateThemes(String? formTheme) {
    if (formTheme == null) return 'Please Select a Theme!';
    return "";
  }

  Widget buildThemeDropdown() {
    return SizedBox(
      height: 40,
      child: DropdownButtonFormField<String>(
        hint: const Text(
          'Select Themes',
        ),
        value: value,
        isExpanded: true,
        elevation: 4,
        items: items.map(buildThemeItem).toList(),
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
        ));
  }

  void addEvent() {
    if (_key.currentState!.validate()) {
      Fluttertoast.showToast(
        msg: 'Event Added',
        toastLength: Toast.LENGTH_SHORT,
      );
      Provider.of<EventProvider>(context, listen: false)
          .addNewEvent(nameController.text, dateController.text, value!);
      //print(createDropDown.dropDownValue);
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
