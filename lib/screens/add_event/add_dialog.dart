import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({Key? key}) : super(key: key);

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  DateTime? date;
  TimeOfDay? time;
  String? value;
  final items = ['Birthday', 'Love', 'Celebration', 'Education', 'Others'];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) {
    return Container(
      height: 420,
      decoration: BoxDecoration(
        color: Colors.white,
        //shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Add an Event',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const CreateTextField(
              labelText: 'Event Name',
              prefixIcon: Icons.event,
              obscure: false,
              validator: null,
              readOnly: false,
            ),
            const SizedBox(
              height: 8,
            ),
            buildDateField(),
            const SizedBox(
              height: 8,
            ),
            buildTimeField(),
            const SizedBox(
              height: 24,
            ),
            buildThemeDropdown(),
            const SizedBox(
              height: 8,
            ),
            buildAddButton(context),
          ],
        ),
      ),
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

  Widget buildTimeField() {
    return TextFormField(
      onTap: () {
        pickTime(context);
      },
      readOnly: true,
      //controller: emailSigninController,
      //validator: validateEmail,
      decoration: InputDecoration(
        hintText: getTimeText(),
        //hintText: 'Email address',
        prefixIcon: const Icon(
          Icons.access_time,
          color: Colors.cyan,
        ),
      ),
    );
  }

  Widget buildThemeDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: const Text('Select Event Theme'),
          value: value,
          isExpanded: true,
          items: items.map(buildThemeItem).toList(),
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
        ),
      ),
    );
  }

  Widget buildAddButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        'ADD EVENT',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 40)),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(2100),
    );

    if (newDate == null) return;
    setState(() {
      date = newDate;
    });
  }

  Future pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;
    setState(() {
      time = newTime;
    });
  }

  String getTimeText() {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time!.hour.toString().padLeft(2, '0');
      final minutes = time!.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  String getDateText() {
    if (date == null) {
      return 'Select Date';
    } else {
      return '${date!.year}-${date!.month}-${date!.day}';
    }
  }

  DropdownMenuItem<String> buildThemeItem(String item) {
    return DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ));
  }
}
