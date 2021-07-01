import 'package:flutter/material.dart';
import '../constants.dart';
import '../brains.dart';

class MonthsOneAndTwo extends StatefulWidget {
  
  final TargetHrCalculate passedBrainObject;
  
  MonthsOneAndTwo({required this.passedBrainObject});

  @override
  _MonthsOneAndTwoState createState() => _MonthsOneAndTwoState();
}

class _MonthsOneAndTwoState extends State<MonthsOneAndTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'POTS APP',
          style: TextStyle(
            color: kTitleColor,
            fontWeight: FontWeight.w900,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
