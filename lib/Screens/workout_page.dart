import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pots_new/Screens/MonthlyWorkoutFiles/PhaseOneScreens/monthOne.dart';
import 'package:pots_new/Screens/Update/updateScreen.dart';
import 'package:pots_new/Widgets/pageViewCarousel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '/Widgets/monthCard.dart';
import '../Widgets/card.dart';
import '../brains.dart';
import '../constants.dart';
import 'MonthlyWorkoutFiles/PhaseThreeScreens/monthFive.dart';
import 'MonthlyWorkoutFiles/PhaseThreeScreens/monthFour.dart';
import 'MonthlyWorkoutFiles/PhaseThreeScreens/monthSix.dart';
import 'MonthlyWorkoutFiles/PhaseTwoScreens/monthThree.dart';
import 'MonthlyWorkoutFiles/PhaseTwoScreens/monthTwo.dart';

//Design One: The First UI with the month based System

// //Phase 1: Month 1
// //Phase 2: Month 2,3
// //Pahse 3: Month 4,5,6

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
  void initState() {
    super.initState();
  }
  // ss

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
          leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Get.to(() => UpdateScreen(
                          age: age,
                          timedHr: timedHr,
                          suppineHr: suppineHr,
                        ));
                  },
                  icon: Icon(
                    Icons.menu,
                    size: 30.0,
                    color: kTitleColor,
                  ))),
          elevation: 0,
          title: Text("POTS APP",
              style: TextStyle(
                  color: kTitleColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30))),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            color: kTitleColor,
            child: Center(
              child: Text("Phase 1",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
          //MonthCard is in Widgets folder
          MonthCard(
            monthName: "Month 1",
            namedRoute: MonthOne(
              passedBrainObject: provider,
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            color: kTitleColor,
            child: Center(
              child: Text("Phase 2",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),

          MonthCard(
            monthName: "Month 2",
            namedRoute: MonthTwo(
              passedBrainObject: provider,
            ),
          ),

          MonthCard(
            monthName: "Month 3",
            namedRoute: MonthThree(
              passedBrainObject: provider,
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            color: kTitleColor,
            child: Center(
              child: Text("Phase 3",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),

          MonthCard(
            monthName: "Month 4",
            namedRoute: MonthFour(
                // passedBrainObject: provider,
                ),
          ),
          MonthCard(
            monthName: "Month 5",
            namedRoute: MonthFive(
                // passedBrainObject: provider,
                ),
          ),
          MonthCard(
            monthName: "Month 6",
            namedRoute: MonthSix(
                // passedBrainObject: provider,
                ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SizedBox(
          height: double.infinity, // card height
          width: double.infinity,
          child: PageView.builder(
            itemCount: 10,
            controller: PageController(viewportFraction: 0.7),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                child: ReusableCard(
                  boxStyle: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadiusCard),
                    color: Colors.white,
                  ),
                  // elevation: 6,
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  cardChild: Center(
                    child: Text(
                      "Card ${i + 1}",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
