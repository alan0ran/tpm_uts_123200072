import 'package:flutter/material.dart';
import 'dart:async';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('WIB', style: TextStyle(fontSize: 18.0)),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(_timeString, style: TextStyle(fontSize: 18.0)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children : [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('WITA', style: TextStyle(fontSize: 18.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(_formatDateTime(DateTime.now().add(Duration(hours: 1))), style: TextStyle(fontSize: 18.0)),
                  ),
                ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('WIT', style: TextStyle(fontSize: 18.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(_formatDateTime(DateTime.now().add(Duration(hours: 2))), style: TextStyle(fontSize: 18.0)),
                  ),
                ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single,
                selectedDayHighlightColor: Colors.deepPurple,
              ),
              initialValue: [],
            ),
          ),
        ],
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }
}