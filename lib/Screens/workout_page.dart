import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../constants.dart';
import '../brains.dart';
import 'stand_test.dart';

class SchedulePage extends StatefulWidget {
  
  SchedulePage({required this.age, required this.suppineHr, required this.timedHr});
  final int age;
  final int suppineHr;
  final int timedHr;

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}