import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  bool isTrue = false;
  bool isAlarm = false;
  bool isAlarmPressed = true;
  bool isHourlyPressed = false;
  bool isTimerPresses = false;
  bool isPlayed = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<String> days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Visibility(
            visible: (isAlarmPressed == true) ? true : false,
            child: Expanded(
              flex: 9,
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        color: Colors.grey.shade200,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      child: SizedBox(
                        height: height / 1.3,
                        width: width / 1.3,
                        child: Align(
                          alignment: Alignment.center,
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              color: Colors.grey.shade200,
                              boxShape: NeumorphicBoxShape.circle(),
                            ),
                            child: SizedBox(
                              height: height / 3,
                              width: width / 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Neumorphic(
                            padding: EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 10,
                              right: 10,
                            ),
                            style: NeumorphicStyle(
                              color: Colors.grey.shade200,
                            ),
                            child: SizedBox(
                              height: height / 9.8,
                              width: width / 1.3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "06:30",
                                        style: TextStyle(
                                          color: (isAlarm != true)
                                              ? Colors.black12
                                              : Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Transform.scale(
                                        scaleX: 0.5,
                                        scaleY: 0.5,
                                        child: NeumorphicSwitch(
                                            style: NeumorphicSwitchStyle(
                                              inactiveTrackColor:
                                                  Colors.black12,
                                              activeTrackColor: Colors.black45,
                                              activeThumbColor: Colors.white,
                                              inactiveThumbColor: Colors.white,
                                            ),
                                            value: isTrue,
                                            onChanged: (val) {
                                              setState(() {
                                                isAlarm = !isAlarm;
                                                isTrue = val;
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: days.map((e) {
                                      return NeumorphicText(
                                        e,
                                        textStyle: NeumorphicTextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        style: NeumorphicStyle(
                                          color: Colors.black12,
                                          depth: 5,
                                          intensity: 0.5,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
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
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        color: Colors.grey.shade200,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      child: SizedBox(
                        height: height / 1.3,
                        width: width / 1.3,
                        child: Text("00:00:00",
                            style: TextStyle(
                              color: Colors.black12,
                              fontSize: 63,
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
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
                                        isPlayed = !isPlayed;
                                      });
                                    },
                                    style: NeumorphicStyle(
                                      color: Colors.grey.shade200,
                                    ),
                                    child: (isPlayed != true)
                                        ? Text(
                                            "Start",
                                            style: TextStyle(
                                              color: Colors.black12,
                                              fontSize: 22,
                                            ),
                                          )
                                        : Text(
                                            "Pause",
                                            style: TextStyle(
                                              color: Colors.black12,
                                              fontSize: 22,
                                            ),
                                          ),
                                  ),
                                ),
                                Transform.scale(
                                  scale: 1,
                                  child: NeumorphicButton(
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    style: NeumorphicStyle(
                                      color: Colors.grey.shade200,
                                    ),
                                    child: (isPlayed != true)
                                        ? Text(
                                            "Reset",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 22,
                                            ),
                                          )
                                        : Text(
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
                          Expanded(
                            flex: 3,
                            child: Neumorphic(),
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
                  scale: 0.8,
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
                        color: Colors.black12,
                      ),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
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
                        color: Colors.black12,
                      ),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
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
                        color: Colors.black12,
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
