import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fromDateProvider = StateProvider<DateTime?>((ref) => null);
final toDateProvider = StateProvider<DateTime?>((ref) => null);

final datePickerProvider = StateProvider<int?>((ref) => null);

final selectedDateRangeProvider = StateProvider<DateTimeRange?>((ref) => null);

