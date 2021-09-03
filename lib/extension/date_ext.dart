import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  DateTime get normalizedDate {
    String convertedDate = new DateFormat("yyyy-MM-dd").format(this);
    return DateTime.parse(convertedDate);
  }

  String get dayRepresentation {
    return DateFormat("EEE").format(this);
  }

  DateTime get startOfWeek {
    return this.subtract(Duration(days: this.weekday - 1));
  }

  DateTime get endOfWeek {
    return this.add(Duration(days: DateTime.daysPerWeek - this.weekday));
  }

  int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  int get weekNumber {
    final date = this;
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(date.year - 1);
    } else if (woy > numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  static List<DateTime> daysBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays + 1; i++) {
      days.add(startDate.add(Duration(days: i)).normalizedDate);
    }
    return days;
  }

  List<DateTime> daysThisWeek() {
    final today = DateTime.now();
    final firstDayOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final days = List.generate(7, (index) {
      final day = firstDayOfWeek.add(Duration(days: index)).normalizedDate;
      return day;
    });
    return days;
  }

  bool get isThisWeek {
    return this.weekNumber == DateTime.now().weekNumber;
  }

  int get daysInMonth {
    var date = this;
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }
}
