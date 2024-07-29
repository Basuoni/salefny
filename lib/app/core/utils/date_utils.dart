// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

String getTimeAgo(
  DateTime time, {
  bool getDateOnly = false,
  bool getTimeOnly = false,
  TimeOfDay? timeOfDay,
}) {
  final dateAgo = timeago.format(time);
  if (dateAgo.contains('moment') || dateAgo.contains('minute')) {
    return dateAgo;
  } else {
    final formattedTime = DateFormat('hh:mm a').format(time);
    final formattedDate = DateFormat('dd/MM/yyyy').format(time);
    if (getDateOnly) return formattedDate;
    // if(getTimeOnly){
    //   final time=DateFormat('hh:mm a').format(timeOfDay!);
    //   return time;
    //
    // }
    return '$formattedDate \t $formattedTime';
  }
}

String formatDate(DateTime time) {
  final formattedDate = DateFormat('dd/MM/yyyy').format(time);
  return formattedDate;
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  final formattedTime = DateFormat.jm().format(dateTime);
  return formattedTime;
}
