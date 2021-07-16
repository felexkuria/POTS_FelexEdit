import 'package:flutter/material.dart';
import '../brains.dart';
import '../constants.dart';
import '../Widgets/card.dart';
import 'GroupedWorkouts/phaseOne.dart';
import 'GroupedWorkouts/phaseTwo.dart';
import 'GroupedWorkouts/phaseThree.dart';
import '/Widgets/monthCard.dart';

//Phase 1: Month 1
//Phase 2: Month 2,3
//Pahse 3: Month 4,5,6

class SchedulePage extends StatefulWidget {
  SchedulePage(
      {required this.age, required this.suppineHr, required this.timedHr});
  final int age;
  final int suppineHr;
  final int timedHr;

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  // DateTime now = new DateTime.now();

  Widget build(BuildContext context) {
    final int age = widget.age;
    final int suppineHr = widget.suppineHr;
    final int timedHr = widget.timedHr;

    TargetHrCalculate provider =
        new TargetHrCalculate(age: age, tenHr: timedHr, suppineHr: suppineHr);

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text('POTS APP',
              style: TextStyle(
                  color: kTitleColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30))),
      body: ListView(
        children: [
          
          //MonthCard is in Widgets folder
          MonthCard(
            monthName: "Month 1",
            namedRoute: PhaseOne(
              passedBrainObject: provider,
            ),
          ),

          MonthCard(
            monthName: "Month 2,3",
            namedRoute: PhaseTwo(
              passedBrainObject: provider,
            ),
          ),

          MonthCard(
            monthName: "Month 4,5,6",
            namedRoute: PhaseThree(),
          ),
        ],
      ),

      //bottomNavigationBar: BottomNavigationBar(
      //   fixedColor: Colors.black,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Progress',
      //       backgroundColor: kTitleColor,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Workout Program',
      //       backgroundColor: kTitleColor,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'Report',
      //       backgroundColor: kTitleColor,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'General Information',
      //       backgroundColor: kTitleColor,
      //     ),
      //   ],
      //   // currentIndex: _selectedIndex,
      //   // selectedItemColor: Colors.amber[800],
      //   // onTap: (){},
      // ),
    );
  }
}
