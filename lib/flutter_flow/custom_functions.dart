import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/custom_auth/auth_util.dart';

int? strToInt(String? someIds) {
  // convert string argument to Int
  if (someIds == null) {
    return null;
  } else {
    return int.tryParse(someIds);
  }
}

double replaceCommasToPoint(double? angka) {
  // replace commas with point
  if (angka == null) return 0.0;
  return double.parse(angka.toString().replaceAll(',', '.'));
}

DateTime? dateNow() {
  // Get date now
  return DateTime.now();
}

String? intToString(String val) {
  // create function for convert integer to string
  return val?.toString();
}

int? calcDoubleInt(
  double arg1,
  int arg2,
) {
  // function multiply arg1(double) and arg2(int) return int
  return (arg1 * arg2).toInt();
}
