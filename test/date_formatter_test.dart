import 'package:asunnyday/utils/date_time_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Date Formatter Test", () {
    //
    DateTime now = DateTime.now();
    //
    final String month = DateTimeFormatter.formatMonth(now.month);
    final int year = now.year;
    final int day = now.day;
    //
    expect(DateTimeFormatter.formatCurrentDate(), "$day $month $year");
  });
}
