import 'dart:async';
import 'dart:math';

import 'package:clock_app/utils/clock_data.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isAlarm = false;
  bool isTrue = false;
  bool isAlarmPressed = true;
  bool isHourlyPressed = false;
  bool isTimerPresses = false;
  bool isPlayed = false;
  bool isStart = false;
  bool isOver = false;
  bool isPause = false;
  bool isRecorded = false;
  int SecStop = 0;
  int MinStop = 0;
  int HourStop = 0;
  String DigitSec = "00";
  String DigitMin = "00";
  String DigitHour = "00";
  int recordIndex = 0;
  bool isSelect = false;
  bool isDay = false;
  double secDiv = 3 * pi / 2;
  int secCount = 0;
  double minuteDiv = 3 * pi / 2;
  int minCount = 0;
  double hourDiv = 3 * pi / 2;
  int hourCount = 0;
  int selectedHour = 0;
  int selectedMinute = 0;
  int selectedSecond = 0;
  String DigitselectedHour = "00";
  String DigitselectedMinute = "00";
  String DigitselectedSecond = "00";
  String currentTimerValue = "";
  String lastRecordedTime = "";

  @override
  void initState() {
    super.initState();
    timerr();
  }

  timerr() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          secDiv += pi / 30;
          secCount++;
          if (secCount == 60) {
            secCount = 0;
            minuteDiv += pi / 30;
            minCount++;
          }
          if (minCount == 60) {
            hourDiv += pi / 6;
            minCount = 0;
          }
        });
      },
    );
    timerr();
  }

  void stop() {
    isStart = false;
  }

  void reset() {
    setState(() {
      isStart = false;
      SecStop = 0;
      MinStop = 0;
      HourStop = 0;
      DigitHour = "00";
      DigitMin = "00";
      DigitSec = "00";
      Records.clear();
    });
  }

  void addRecord(val) {
    if (isStart) {
      setState(() {
        lastRecordedTime = val;
        Records.add(lastRecordedTime);
      });
    }
  }

  void start() async {
    isStart = true;
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          SecStop++;
          if (SecStop > 59) {
            MinStop++;
            SecStop = 0;
          }
          if (MinStop > 59) {
            HourStop++;
            MinStop = 0;
          }
          if (HourStop > 23) {
            HourStop = 0;
          }
          DigitSec = (SecStop >= 10) ? "$SecStop" : "0$SecStop";
          DigitMin = (MinStop >= 10) ? "$MinStop" : "0$MinStop";
          DigitHour = (HourStop >= 10) ? "$HourStop" : "0$HourStop";
          currentTimerValue = "$DigitHour:$DigitMin:$DigitSec";
        });
      },
    );
    (isStart == true) ? start() : stop();
  }

  void SelectedHourIncrees() {
    setState(() {
      if (selectedHour == 12) {
        selectedHour = 12;
      } else {
        selectedHour++;
      }
      DigitselectedHour =
          (selectedHour > 9) ? "$selectedHour" : "0$selectedHour";
    });
  }

  void SelectedHourDecrees() {
    setState(() {
      if (selectedHour > 0) {
        selectedHour--;
      } else {
        selectedHour = 0;
      }
      DigitselectedHour =
          (selectedHour > 9) ? "$selectedHour" : "0$selectedHour";
    });
  }

  void SelectedMinIncrees() {
    setState(() {
      if (selectedMinute == 59) {
        selectedMinute = 59;
      } else {
        selectedMinute++;
      }
      DigitselectedMinute =
          (selectedMinute > 9) ? "$selectedMinute" : "0$selectedMinute";
    });
  }

  void SelectedMinDecrees() {
    setState(() {
      if (selectedMinute > 0) {
        selectedMinute--;
      } else {
        selectedMinute = 0;
      }
      DigitselectedMinute =
          (selectedMinute > 9) ? "$selectedMinute" : "0$selectedMinute";
    });
  }

  void SelectedSecIncrees() {
    setState(() {
      if (selectedSecond == 59) {
        selectedSecond = 59;
      } else {
        selectedSecond++;
      }
      DigitselectedSecond =
          (selectedSecond > 9) ? "$selectedSecond" : "0$selectedSecond";
    });
  }

  void SelectedSecDecrees() {
    setState(() {
      if (selectedSecond > 0) {
        selectedSecond--;
      } else {
        selectedSecond = 0;
      }
      DigitselectedSecond =
          (selectedSecond > 9) ? "$selectedSecond" : "0$selectedSecond";
    });
  }

  void countStop() {
    isStart = false;
  }

  void countReset() {
    isStart = false;
    selectedSecond = 0;
    selectedMinute = 0;
    selectedHour = 0;

    DigitselectedSecond = "00";
    DigitselectedMinute = "00";
    DigitselectedHour = "00";
  }

  void countStart() async {
    isStart = true;
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          if (selectedSecond > 0) {
            selectedSecond--;
          } else {
            if (selectedMinute > 0) {
              selectedMinute--;
              selectedSecond = 59;
            } else {
              if (selectedHour > 0) {
                selectedHour--;
                selectedMinute = 59;
                selectedSecond = 59;
              }
            }
          }
          if (selectedHour == 0 && selectedMinute == 0 && selectedSecond == 0) {
            isStart = false;
          }
          DigitselectedHour =
              (selectedHour > 10) ? "$selectedHour" : "0$selectedHour";
          DigitselectedMinute =
              (selectedMinute > 10) ? "$selectedMinute" : "0$selectedMinute";
          DigitselectedSecond =
              (selectedSecond > 10) ? "$selectedSecond" : "0$selectedSecond";
        });
      },
    );
    (isStart == true) ? countStart() : countStop();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Visibility(
            visible: (isAlarmPressed == true) ? true : false,
            child: Expanded(
              flex: 9,
              child: Stack(
                alignment: const Alignment(0.8, 1),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            color: Colors.grey.shade200,
                            boxShape: const NeumorphicBoxShape.circle(),
                          ),
                          child: SizedBox(
                            height: height / 1.3,
                            width: width / 1.3,
                            child: Align(
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Transform.rotate(
                                    angle: pi / 2,
                                    child: const Divider(
                                      thickness: 2,
                                      endIndent: 300,
                                    ),
                                  ),
                                  Transform.rotate(
                                    angle: pi,
                                    child: const Divider(
                                      thickness: 2,
                                      endIndent: 300,
                                    ),
                                  ),
                                  Transform.rotate(
                                    angle: 3 * pi / 2,
                                    child: const Divider(
                                      thickness: 2,
                                      endIndent: 300,
                                    ),
                                  ),
                                  Transform.rotate(
                                    angle: 2 * pi,
                                    child: const Divider(
                                      thickness: 2,
                                      endIndent: 300,
                                    ),
                                  ),
                                  Neumorphic(
                                    style: NeumorphicStyle(
                                      color: Colors.grey.shade200,
                                      boxShape:
                                          const NeumorphicBoxShape.circle(),
                                    ),
                                    child: SizedBox(
                                      height: height / 3,
                                      width: width / 3,
                                    ),
                                  ),
                                  Transform.rotate(
                                    angle: secDiv,
                                    child: const Divider(
                                      thickness: 2,
                                      color: Colors.black12,
                                      endIndent: 30,
                                      indent: 140,
                                    ),
                                  ),
                                  Transform.rotate(
                                    angle: minuteDiv,
                                    child: const Divider(
                                      thickness: 2,
                                      color: Colors.black,
                                      endIndent: 60,
                                      indent: 145,
                                    ),
                                  ),
                                  Transform.rotate(
                                    angle: hourDiv,
                                    child: const Divider(
                                      thickness: 2,
                                      color: Colors.red,
                                      endIndent: 100,
                                      indent: 145,
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 2,
                                    child: Neumorphic(
                                      style: NeumorphicStyle(
                                        depth: 1,
                                        intensity: 1,
                                        color: Colors.grey.shade200,
                                      ),
                                      child: SizedBox(
                                        height: height / 150,
                                        width: width / 60,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: alarms.map((alarm) {
                                return Stack(
                                  alignment: const Alignment(1.05, -1.4),
                                  children: [
                                    Neumorphic(
                                        margin:
                                            const EdgeInsets.only(bottom: 7),
                                        padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 20,
                                          right: 20,
                                        ),
                                        style: NeumorphicStyle(
                                          color: Colors.grey.shade200,
                                        ),
                                        child: SizedBox(
                                          height: height / 10.2,
                                          width: width / 1.4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${alarm.time.hour}:${alarm.time.minute}",
                                                    style: TextStyle(
                                                      color: (isAlarm != true)
                                                          ? Colors.black12
                                                          : Colors.black,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height / 15,
                                                  ),
                                                  Transform.scale(
                                                    scaleX: 0.5,
                                                    scaleY: 0.5,
                                                    child: NeumorphicSwitch(
                                                        style:
                                                            NeumorphicSwitchStyle(
                                                          inactiveTrackColor:
                                                              Colors.black12,
                                                          activeTrackColor:
                                                              Colors.black45,
                                                          activeThumbColor:
                                                              Colors.grey
                                                                  .shade200,
                                                          inactiveThumbColor:
                                                              Colors.grey
                                                                  .shade200,
                                                        ),
                                                        value: alarm.isDay,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            isAlarm = !isAlarm;
                                                            alarm.isDay = val;
                                                          });
                                                        }),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: days.map((e) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      e['isDay'] = !e['isDay'];
                                                    },
                                                    child: NeumorphicText(
                                                      "${e['day']}",
                                                      textStyle:
                                                          NeumorphicTextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      style: NeumorphicStyle(
                                                        color:
                                                            (e['isDay'] != true)
                                                                ? Colors.black12
                                                                : Colors.black,
                                                        depth: 5,
                                                        intensity: 0.5,
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        )),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          alarms.remove(alarm);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                        size: 16,
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 0.9,
                    child: NeumorphicButton(
                      margin: const EdgeInsets.only(
                        left: 20,
                      ),
                      style: NeumorphicStyle(
                        depth: 1,
                        intensity: 1,
                        color: Colors.grey.shade200,
                      ),
                      onPressed: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                          initialEntryMode: TimePickerEntryMode.dial,
                        );

                        if (timeOfDay != null) {
                          setState(() {
                            alarms
                                .add(CustomAlarm(time: timeOfDay, isDay: true));
                          });
                        }
                      },
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: (isHourlyPressed == true) ? true : false,
            child: Expanded(
              flex: 9,
              child: Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 5,
                    child: Transform.scale(
                      scaleX: 0.9,
                      child: Neumorphic(
                        style: const NeumorphicStyle(
                          color: Colors.transparent,
                          depth: -5,
                          intensity: 1,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: (isStart != true)
                                        ? MainAxisAlignment.spaceEvenly
                                        : MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: height / 20,
                                      ),
                                      Visibility(
                                        visible:
                                            (isStart != true) ? true : false,
                                        child: Transform.scale(
                                          scale: 0.7,
                                          child: NeumorphicButton(
                                            style: NeumorphicStyle(
                                              color: Colors.grey.shade200,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                SelectedHourDecrees();
                                              });
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              size: 32,
                                            ),
                                          ),
                                        ),
                                      ),
                                      NeumorphicText(
                                        "$DigitselectedHour",
                                        textStyle: NeumorphicTextStyle(
                                          fontSize: 42,
                                        ),
                                        style: NeumorphicStyle(
                                          color: Colors.black,
                                          depth: 1,
                                          intensity: 1,
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            (isStart != true) ? true : false,
                                        child: Transform.scale(
                                          scale: 0.7,
                                          child: NeumorphicButton(
                                            style: NeumorphicStyle(
                                              color: Colors.grey.shade200,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                SelectedHourIncrees();
                                              });
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_up_sharp,
                                              size: 32,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 20,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      NeumorphicText(
                                        ":",
                                        style: NeumorphicStyle(
                                          color: Colors.black,
                                          depth: 1,
                                          intensity: 1,
                                        ),
                                        textStyle:
                                            NeumorphicTextStyle(fontSize: 36),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: height / 20,
                                      ),
                                      Visibility(
                                        visible:
                                            (isStart != true) ? true : false,
                                        child: Transform.scale(
                                          scale: 0.7,
                                          child: NeumorphicButton(
                                            style: NeumorphicStyle(
                                              color: Colors.grey.shade200,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                SelectedMinDecrees();
                                              });
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              size: 32,
                                            ),
                                          ),
                                        ),
                                      ),
                                      NeumorphicText(
                                        "$DigitselectedMinute",
                                        textStyle: NeumorphicTextStyle(
                                          fontSize: 42,
                                        ),
                                        style: NeumorphicStyle(
                                          color: Colors.black,
                                          depth: 1,
                                          intensity: 1,
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            (isStart != true) ? true : false,
                                        child: Transform.scale(
                                          scale: 0.7,
                                          child: NeumorphicButton(
                                            style: NeumorphicStyle(
                                              color: Colors.grey.shade200,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                SelectedMinIncrees();
                                              });
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_up_sharp,
                                              size: 32,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 20,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      NeumorphicText(
                                        ":",
                                        style: NeumorphicStyle(
                                          color: Colors.black,
                                          depth: 1,
                                          intensity: 1,
                                        ),
                                        textStyle:
                                            NeumorphicTextStyle(fontSize: 36),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: height / 20,
                                      ),
                                      Visibility(
                                        visible:
                                            (isStart != true) ? true : false,
                                        child: Transform.scale(
                                          scale: 0.7,
                                          child: NeumorphicButton(
                                            style: NeumorphicStyle(
                                              color: Colors.grey.shade200,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                SelectedSecDecrees();
                                              });
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              size: 32,
                                            ),
                                          ),
                                        ),
                                      ),
                                      NeumorphicText(
                                        "$DigitselectedSecond",
                                        textStyle: NeumorphicTextStyle(
                                          fontSize: 42,
                                        ),
                                        style: NeumorphicStyle(
                                          color: Colors.black,
                                          depth: 1,
                                          intensity: 1,
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            (isStart != true) ? true : false,
                                        child: Transform.scale(
                                          scale: 0.7,
                                          child: NeumorphicButton(
                                            style: NeumorphicStyle(
                                              color: Colors.grey.shade200,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                SelectedSecIncrees();
                                              });
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_up_sharp,
                                              size: 32,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: (isStart != true)
                                    ? MainAxisAlignment.spaceEvenly
                                    : MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 90,
                                    child: NeumorphicText(
                                      "HH",
                                      style: const NeumorphicStyle(
                                        color: Colors.black,
                                        depth: 1,
                                        intensity: 1,
                                      ),
                                      textStyle: NeumorphicTextStyle(
                                        fontSize: 27,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                    child: NeumorphicText(
                                      "MM",
                                      style: const NeumorphicStyle(
                                        color: Colors.black,
                                        depth: 1,
                                        intensity: 1,
                                      ),
                                      textStyle: NeumorphicTextStyle(
                                        fontSize: 27,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                    child: NeumorphicText(
                                      "SS",
                                      style: const NeumorphicStyle(
                                        color: Colors.black,
                                        depth: 1,
                                        intensity: 1,
                                      ),
                                      textStyle: NeumorphicTextStyle(
                                        fontSize: 27,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: (isStart == false) ? true : false,
                          child: Transform.scale(
                            scale: 1.3,
                            child: NeumorphicButton(
                                style: NeumorphicStyle(
                                  color: Colors.grey.shade200,
                                  depth: 1,
                                  intensity: 1,
                                  boxShape: const NeumorphicBoxShape.circle(),
                                ),
                                child: const Icon(Icons.play_arrow_outlined),
                                onPressed: () {
                                  setState(() {
                                    countStart();
                                    isPause = false;
                                  }); // Start the countdown
                                }),
                          ),
                        ),
                        Visibility(
                          visible: (isStart == true) ? true : false,
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: NeumorphicButton(
                                  style: NeumorphicStyle(
                                    color: Colors.grey.shade200,
                                    boxShape: const NeumorphicBoxShape.circle(),
                                  ),
                                  child: (isPause != true)
                                      ? const Icon(Icons.pause_sharp)
                                      : const Icon(Icons.play_arrow_outlined),
                                  onPressed: () {
                                    setState(() {
                                      (isPause == false)
                                          ? countStop()
                                          : countStart();
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: width / 10,
                              ),
                              Transform.scale(
                                scale: 1.3,
                                child: NeumorphicButton(
                                  style: NeumorphicStyle(
                                    color: Colors.grey.shade200,
                                    boxShape: const NeumorphicBoxShape.circle(),
                                  ),
                                  child: const Icon(
                                    Icons.restart_alt_sharp,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      countReset();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: (isTimerPresses == true) ? true : false,
            child: Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 7,
                    child: Transform.scale(
                      scale: 5,
                      child: Align(
                        alignment: Alignment.center,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            color: Colors.grey.shade200,
                            depth: -1,
                            intensity: 1,
                            boxShape: const NeumorphicBoxShape.circle(),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: NeumorphicText(
                              "$DigitHour:$DigitMin:$DigitSec",
                              textStyle: NeumorphicTextStyle(
                                fontSize: 12,
                              ),
                              style: const NeumorphicStyle(
                                depth: 1,
                                intensity: 1,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Transform.scale(
                                  scale: 1,
                                  child: NeumorphicButton(
                                    onPressed: () {
                                      setState(() {
                                        isStart = !isStart;
                                      });
                                      if (!isStart) {
                                        stop(); // Reset when "Start" becomes "Reset"
                                      } else {
                                        start(); // Start the timer
                                      }
                                    },
                                    style: NeumorphicStyle(
                                      color: Colors.grey.shade200,
                                    ),
                                    child: (!isStart)
                                        ? const Text(
                                            "Start",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                            ),
                                          )
                                        : const Text(
                                            "Pause",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                            ),
                                          ),
                                  ),
                                ),
                                Transform.scale(
                                  scale: 1,
                                  child: NeumorphicButton(
                                    onPressed: () {
                                      if (!isStart) {
                                        reset(); // Reset the timer and clear records
                                      } else {
                                        addRecord(currentTimerValue);
                                      }
                                    },
                                    style: NeumorphicStyle(
                                      color: Colors.grey.shade200,
                                    ),
                                    child: (!isStart)
                                        ? const Text(
                                            "Reset",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 22,
                                            ),
                                          )
                                        : const Text(
                                            "Record",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 22,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          Expanded(
                            flex: 5,
                            child: SingleChildScrollView(
                              child: Column(
                                children: Records.map((e) {
                                  return Neumorphic(
                                    margin: EdgeInsets.only(bottom: 7),
                                    style: NeumorphicStyle(
                                      color: Colors.grey.shade200,
                                      depth: -1,
                                      intensity: 1,
                                    ),
                                    child: SizedBox(
                                      height: height / 27,
                                      width: width / 1.5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          NeumorphicText(
                                            "Recorded",
                                            textStyle: NeumorphicTextStyle(
                                              fontSize: 16,
                                            ),
                                            style: const NeumorphicStyle(
                                              depth: 1,
                                              intensity: 1,
                                            ),
                                          ),
                                          NeumorphicText(
                                            e,
                                            textStyle: NeumorphicTextStyle(
                                              fontSize: 16,
                                            ),
                                            style: const NeumorphicStyle(
                                              depth: 1,
                                              intensity: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Transform.scale(
                  scale: 0.7,
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      color: Colors.grey.shade200,
                      depth: (isAlarmPressed != true) ? 2 : -2,
                      intensity: 1,
                    ),
                    onPressed: () {
                      setState(() {
                        isAlarmPressed = true;
                        isHourlyPressed = false;
                        isTimerPresses = false;
                      });
                    },
                    child: NeumorphicIcon(
                      Icons.access_alarm,
                      size: 42,
                      style: NeumorphicStyle(
                        depth: (isAlarmPressed != false) ? 1 : 0.2,
                        intensity: 1,
                        color: (isAlarmPressed != true)
                            ? Colors.black12
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      color: Colors.grey.shade200,
                      depth: (isHourlyPressed != true) ? 2 : -2,
                      intensity: 1,
                    ),
                    onPressed: () {
                      setState(() {
                        isAlarmPressed = false;
                        isHourlyPressed = true;
                        isTimerPresses = false;
                      });
                    },
                    child: NeumorphicIcon(
                      Icons.hourglass_empty_sharp,
                      size: 42,
                      style: NeumorphicStyle(
                        depth: (isHourlyPressed != false) ? 1 : 0.2,
                        intensity: 1,
                        color: (isHourlyPressed != true)
                            ? Colors.black12
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      color: Colors.grey.shade200,
                      depth: (isTimerPresses != true) ? 2 : -2,
                      intensity: 1,
                    ),
                    onPressed: () {
                      setState(() {
                        isAlarmPressed = false;
                        isHourlyPressed = false;
                        isTimerPresses = true;
                      });
                    },
                    child: NeumorphicIcon(
                      Icons.timer_sharp,
                      size: 42,
                      style: NeumorphicStyle(
                        depth: (isTimerPresses != false) ? 1 : 0.2,
                        intensity: 1,
                        color: (isTimerPresses != true)
                            ? Colors.black12
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
