import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../constants.dart';
import '../brains.dart';
import 'stand_test.dart';
import '../Widgets/card.dart';

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
    final int age = widget.age;
    final int suppineHr = widget.suppineHr;
    final int timedHr = widget.timedHr;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'POTS APP',
          style: kCardTitleStyle,
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          Expanded(
            child: ReusableCard(
              boxStyle: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              cardChild:Center(child: Text('MONTHS 1-2', style: kCardTitleStyle,),),
            ),
          ),
          
          Expanded(
            child: ReusableCard(
              boxStyle: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              cardChild:Center(child: Text('MONTHS 3-5', style: kCardTitleStyle,),),
            ),
          ),
          
          Expanded(
            child: ReusableCard(
              boxStyle: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              cardChild:Center(child: Text('MONTHS 6-7', style: kCardTitleStyle,),),
            ),
          ),
        ],
      ),
    );
  }
}