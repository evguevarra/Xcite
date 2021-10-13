import 'dart:ui';

import 'package:event_app/widgets/blue_button.dart';
import 'package:event_app/widgets/datetime_picker.dart';
import 'package:event_app/widgets/dropdown.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({Key? key}) : super(key: key);

  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final items = ['Birthday', 'Love', 'Celebration', 'Education', 'Others'];
  final TextEditingController dateController = TextEditingController();
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
                onTap: () {},
              ),
              const SizedBox(height: 8),
              DateTimePicker(
                validator: validateDate,
                controller: dateController,
              ),
              const SizedBox(height: 8),
              CreateDropDown(
                hint: 'Select Themes',
                items: items,
                //validator: validateThemes,
              ),
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

  void addEvent() {
    if (_key.currentState!.validate()) {
      Fluttertoast.showToast(
        msg: 'Event Added',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
}
