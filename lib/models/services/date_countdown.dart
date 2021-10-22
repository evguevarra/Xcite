class DateCountdown {
  String timeLeft(DateTime due) {
    String returnValue;

    Duration _timeUntilDue = due.difference(DateTime.now());

    int _daysUntil = _timeUntilDue.inDays;
    int _hoursUntil = _timeUntilDue.inHours - (_daysUntil * 24);
    int _minUntil =
        _timeUntilDue.inMinutes - (_daysUntil * 24 * 60) - (_hoursUntil * 60);
    int _secUntil = _timeUntilDue.inSeconds -
        (_daysUntil * 24 * 60 * 60) -
        (_hoursUntil * 60 * 60) -
        (_minUntil * 60);

    if (_daysUntil > 0) {
      returnValue = _daysUntil.toString() +
          " days\n" +
          _hoursUntil.toString() +
          " hours\n" +
          _minUntil.toString() +
          " mins\n" +
          _secUntil.toString() +
          "secs\n";
    } else if (_hoursUntil > 0) {
      returnValue = _hoursUntil.toString() +
          " hours\n" +
          _minUntil.toString() +
          " mins\n" +
          _secUntil.toString() +
          "secs\n";
    } else if (_minUntil > 0) {
      returnValue =
          _minUntil.toString() + " mins\n" + _secUntil.toString() + "secs\n";
    } else if (_secUntil > 0) {
      returnValue = _secUntil.toString() + "secs\n";
    } else {
      returnValue = "Done";
    }

    return returnValue;
  }
}
