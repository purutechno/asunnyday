class DateTimeFormatter {
  static const List<String> _month = [
    "Zero Value",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static String formatCurrentDate() {
    final DateTime now = DateTime.now();
    final _year = now.year;
    final _month = now.month;
    final _stringMonth = formatMonth(_month);
    final _day = now.day;

    final String formattedDate = "$_day $_stringMonth $_year";
    return formattedDate;
  }

  static String formatMonth(int month) {
    return _month[month];
  }
}
