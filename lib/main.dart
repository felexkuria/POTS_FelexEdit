import 'package:flutter/material.dart';
import 'constants.dart';
import 'Screens/input_page.dart';
import 'Screens/stand_test.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'Screens/workout_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: kBackground),
        scaffoldBackgroundColor: kBackground,
      ),

      home: Input(),

      // initialRoute: '/input',
      // routes:{
      //   '/input': (context) => Input(),
      //   '/standTest': (context) => StandingTestPage(),
      //   '/schedulePage': (context) => SchedulePage()
      // }
    );
  }
}
