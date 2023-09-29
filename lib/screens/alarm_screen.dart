import 'package:clock_app/utils/clock_data.dart';
import 'package:flutter/cupertino.dart';
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
  bool isStart = false;
  bool isOver = false;
  bool isPause = false;
  bool isSelect = false;
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
              child: Column(
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
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              color: Colors.grey.shade200,
                              boxShape: const NeumorphicBoxShape.circle(),
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
                                              activeThumbColor:
                                                  Colors.grey.shade200,
                                              inactiveThumbColor:
                                                  Colors.grey.shade200,
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
                                        style: const NeumorphicStyle(
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
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 5,
                    child: Transform.scale(
                      scaleX: 0.9,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          color: Colors.grey.shade200,
                          depth: -5,
                          intensity: 1,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Transform.scale(
                                        scale: 3,
                                        child: NeumorphicIcon(
                                          Icons.arrow_right,
                                          style: NeumorphicStyle(
                                            color: Colors.black,
                                            depth: 1,
                                            intensity: 1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 50,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 90,
                                    child: ListWheelScrollView(
                                      itemExtent: 50,
                                      overAndUnderCenterOpacity: 0.2,
                                      perspective: 0.005,
                                      diameterRatio: 1.2,
                                      physics: FixedExtentScrollPhysics(),
                                      children: hour.map((e) {
                                        return NeumorphicText(
                                          "$e",
                                          style: NeumorphicStyle(
                                            color: Colors.black,
                                            depth: 1,
                                            intensity: 1,
                                          ),
                                          textStyle: NeumorphicTextStyle(
                                            fontSize: 32,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Container(
                                    width: 90,
                                    child: ListWheelScrollView(
                                      itemExtent: 50,
                                      perspective: 0.005,
                                      diameterRatio: 1.2,
                                      overAndUnderCenterOpacity: 0.2,
                                      physics: FixedExtentScrollPhysics(),
                                      children: min.map((e) {
                                        return NeumorphicText(
                                          "$e",
                                          style: NeumorphicStyle(
                                            color: Colors.black,
                                            depth: 1,
                                            intensity: 1,
                                          ),
                                          textStyle: NeumorphicTextStyle(
                                            fontSize: 32,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Container(
                                    width: 90,
                                    child: ListWheelScrollView(
                                      itemExtent: 50,
                                      perspective: 0.005,
                                      diameterRatio: 1.2,
                                      overAndUnderCenterOpacity: 0.2,
                                      onSelectedItemChanged: (value) =>
                                          isSelect = true,
                                      physics: FixedExtentScrollPhysics(),
                                      children: second.map((e) {
                                        return NeumorphicText(
                                          "$e",
                                          style: NeumorphicStyle(
                                            color: Colors.black,
                                            depth: 1,
                                            intensity: 1,
                                          ),
                                          textStyle: NeumorphicTextStyle(
                                            fontSize: 32,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: width / 20,
                                  ),
                                  Container(
                                    width: 90,
                                    child: NeumorphicText(
                                      "HH",
                                      style: NeumorphicStyle(
                                        color: Colors.black,
                                        depth: 1,
                                        intensity: 1,
                                      ),
                                      textStyle: NeumorphicTextStyle(
                                        fontSize: 27,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 90,
                                    child: NeumorphicText(
                                      "MM",
                                      style: NeumorphicStyle(
                                        color: Colors.black,
                                        depth: 1,
                                        intensity: 1,
                                      ),
                                      textStyle: NeumorphicTextStyle(
                                        fontSize: 27,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 90,
                                    child: NeumorphicText(
                                      "SS",
                                      style: NeumorphicStyle(
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
                                boxShape: NeumorphicBoxShape.circle(),
                              ),
                              child: Icon(Icons.play_arrow_outlined),
                              onPressed: () {
                                setState(() {
                                  isStart = true;
                                });
                              },
                            ),
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
                                    boxShape: NeumorphicBoxShape.circle(),
                                  ),
                                  child: (isPause != true)
                                      ? Icon(Icons.pause_sharp)
                                      : Icon(Icons.play_arrow_outlined),
                                  onPressed: () {
                                    setState(() {
                                      isPause = !isPause;
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
                                    boxShape: NeumorphicBoxShape.circle(),
                                  ),
                                  child: Icon(
                                    Icons.restart_alt_sharp,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isStart = false;
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
                            boxShape: NeumorphicBoxShape.circle(),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: NeumorphicText(
                              "00:00:00",
                              textStyle: NeumorphicTextStyle(
                                fontSize: 12,
                              ),
                              style: NeumorphicStyle(
                                depth: 1,
                                intensity: 1,
                              ),
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
                                      setState(() {});
                                    },
                                    style: NeumorphicStyle(
                                      color: Colors.grey.shade200,
                                    ),
                                    child: (isPlayed != true)
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
