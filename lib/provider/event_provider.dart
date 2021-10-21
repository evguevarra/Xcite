import 'package:event_app/models/core/event.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = <Event>[];

  List<Event> get getEvent {
    return _events;
  }

  EventProvider() {
    addNewEvent('Birthdate', 'May 8', 'Birthday');
    addNewEvent('Love', 'May 8', 'Love');
    addNewEvent('Education', 'May 8', 'Education');
    addNewEvent('Celebration', 'May 8', 'Celebration');
  }

  void addNewEvent(String name, String dateTime, String theme) {
    Event event = Event(
      eventName: name,
      eventDateTime: dateTime,
      eventTheme: theme,
    );
    _events.insert(0, event);
    //_events.add(event);
    notifyListeners();
  }
}
