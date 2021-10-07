import 'package:flutter/material.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({Key? key}) : super(key: key);

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      //backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        //shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Add an Event',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildEventNameField(),
            buildDateField(),
          ],
        ),
      ),
    );
  }

  TextFormField buildEventNameField() {
    return TextFormField(
      //controller: emailSigninController,
      //validator: validateEmail,
      decoration: const InputDecoration(
        labelText: "Event Name",
        //hintText: 'Email address',
        prefixIcon: Icon(
          Icons.event,
          color: Colors.cyan,
        ),
        //border: ,
      ),
      textInputAction: TextInputAction.done,
    );
  }

  Widget buildDateField() {
    return TextFormField(
      onTap: () {
        pickDate(context);
      },
      readOnly: true,
      //controller: emailSigninController,
      //validator: validateEmail,
      decoration: InputDecoration(
        hintText: getDateText(),
        //hintText: 'Email address',
        prefixIcon: const Icon(
          Icons.calendar_today,
          color: Colors.cyan,
        ),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(2100),
    );

    if (newDate == null) return;
    setState(() {
      date = newDate;
    });
  }

  String getDateText() {
    if (date == null) {
      return 'Select Date';
    } else {
      return '${date!.year}-${date!.month}-${date!.day}';
    }
  }
}
