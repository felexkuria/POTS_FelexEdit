import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'Screens/UserTests/input_page.dart';
import 'Screens/UserTests/stand_test.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'Screens/workout_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: kBackground),
        scaffoldBackgroundColor: kBackground,
      ),
      home: Input(),
    );
  }
}
