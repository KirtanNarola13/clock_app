import 'dart:async';

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

List<Map> days = [
  {'day': 'SUN', 'isDay': false},
  {'day': 'MON', 'isDay': false},
  {'day': 'TUE', 'isDay': false},
  {'day': 'WED', 'isDay': false},
  {'day': 'THU', 'isDay': false},
  {'day': 'FRI', 'isDay': false},
  {'day': 'SAT', 'isDay': false},
];
List<String> hour = [
  "00",
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
];
List<String> min = [
  "00",
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21",
  "22",
  "23",
  "24",
  "25",
  "26",
  "27",
  "28",
  "29",
  "30",
  "31",
  "32",
  "33",
  "34",
  "35",
  "36",
  "37",
  "38",
  "39",
  "40",
  "41",
  "42",
  "43",
  "44",
  "45",
  "46",
  "47",
  "48",
  "49",
  "50",
  "51",
  "52",
  "53",
  "54",
  "55",
  "56",
  "57",
  "58",
  "59",
];
List<String> second = [
  "00",
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21",
  "22",
  "23",
  "24",
  "25",
  "26",
  "27",
  "28",
  "29",
  "30",
  "31",
  "32",
  "33",
  "34",
  "35",
  "36",
  "37",
  "38",
  "39",
  "40",
  "41",
  "42",
  "43",
  "44",
  "45",
  "46",
  "47",
  "48",
  "49",
  "50",
  "51",
  "52",
  "53",
  "54",
  "55",
  "56",
  "57",
  "58",
  "59",
];

List Records = [];

class Timer {
  int houre = 00, min = 00, sec = 00;

  Future? timer() {
    Future.delayed(
      Duration(seconds: 1),
      () {
        if (sec >= 0 && sec <= 59) {
          sec++;
        }
        if (sec > 59) {
          sec = 00;
          min += 1;
        } else if (min > 59) {
          min = 00;
          houre += 1;
        }
      },
    );
    timer();
  }
}

class ClockData {
  // Other properties and methods...

  static int selectedHour = 0;
  static int selectedMinute = 0;
  static int selectedSecond = 0;

  static int getSelectedHour() {
    return selectedHour;
  }

  static int getSelectedMinute() {
    return selectedMinute;
  }

  static int getSelectedSecond() {
    return selectedSecond;
  }
}

class CustomAlarm {
  TimeOfDay time;
  bool isDay;

  CustomAlarm({required this.time, required this.isDay});
}

List<CustomAlarm> alarms = [];
