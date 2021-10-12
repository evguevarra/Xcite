import 'dart:ui';

import 'package:event_app/widgets/blue_button.dart';
import 'package:event_app/widgets/datetime_picker.dart';
import 'package:event_app/widgets/dropdown.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({Key? key}) : super(key: key);

  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
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
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CreateTextField(
              prefixIcon: Icons.event,
              labelText: 'Event Name',
              obscure: false,
              readOnly: false,
            ),
            const SizedBox(height: 16),
            DateTimePicker(controller: dateController),
            const SizedBox(height: 16),
            CreateDropDown(hint: 'Select Themes', items: items),
            const SizedBox(height: 16),
            CreateButton(
                text: 'ADD EVENT', onPressed: () => print('Pressed Add'))
          ],
        ),
      ),
    );
  }
}
