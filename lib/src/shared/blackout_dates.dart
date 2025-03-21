
import 'package:flutter/material.dart';

/// The `BlackoutDates` class is used to specify the `blackoutDates`
/// parameter in the `RangeDatePicker` widget, allowing you to specify
/// either specific dates or ranges of dates that cannot be selected.
class BlackoutDates
{
  final DateTime? dateTime;
  final DateTimeRange? dateTimeRange;

  // ignore: unused_element
  BlackoutDates._(this.dateTime, this.dateTimeRange);
  BlackoutDates.fromDate(this.dateTime) : dateTimeRange = null;
  BlackoutDates.fromRange(this.dateTimeRange) : dateTime = null;

  List<DateTime> toList() {
    
    if(dateTimeRange == null) {
      return [dateTime!];
    }

    final List<DateTime> retval = [];
    DateTime current = dateTimeRange!.start;

    while(!current.isAfter(dateTimeRange!.end)) {
      retval.add(current);
      current = current.add(const Duration(
        days: 1
      ));
    }

    return retval;
  }
}
