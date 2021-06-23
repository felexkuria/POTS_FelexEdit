import 'package:flutter/material.dart';
import '../constants.dart';
import '../brains.dart';
import 'stand_test.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({ Key? key }) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {


  // HrCalculate current = new HrCalculate(, );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "POTS APP",
          style: kCardTitleStyle,
        )
      ),
      // body: Column(
      //   children: <Widget>[
      //     Text()
      //   ]

      // ),
    );
  }
}