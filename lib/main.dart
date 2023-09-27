import 'package:clock_app/screens/alarm_screen.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

void main() {
  runApp(
    NeumorphicApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AlarmPage(),
      },
    ),
  );
}
