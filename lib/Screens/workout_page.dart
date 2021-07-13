import 'package:flutter/material.dart';
import '../brains.dart';
import '../constants.dart';
import '../Widgets/card.dart';
import 'GroupedWorkouts/section1.dart';
import 'GroupedWorkouts/section2.dart';
import 'GroupedWorkouts/section3.dart';

//Phase 1: Month 1
//Phase 2: Month 2,3
//Pahse 3: Month 4,5,6

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
  // DateTime now = new DateTime.now();
  
  Widget build(BuildContext context) {

    final int age = widget.age;
    final int suppineHr = widget.suppineHr;
    final int timedHr = widget.timedHr;

    TargetHrCalculate provider = new TargetHrCalculate(age: age, tenHr: timedHr, suppineHr: suppineHr);

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text('POTS APP',
              style: TextStyle(
                  color: kTitleColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[        
          Expanded(
            child: GestureDetector(
              child: Expanded(
                child: ReusableCard(
                  boxStyle: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                  cardChild:Center(child: Text('MONTH 1', style: kCardTitleStyle,),),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => SectionOne(
                      passedBrainObject: provider
                    )
                  )
                );
              },
            ),
          ),
          
          Expanded(
            child: GestureDetector(
              child: Expanded(
                child: ReusableCard(
                  boxStyle: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                  cardChild:Center(child: Text('MONTHS 2,3', style: kCardTitleStyle,),),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => Section2()
                  )
                );
              }
            ),
          ),
          
          Expanded(
            child: GestureDetector(
              child: Expanded(
                child: ReusableCard(
                  boxStyle: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                  cardChild:Center(child: Text('MONTHS 4,5,6', style: kCardTitleStyle,),),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => Section3()
                  )
                );
              }
            ),
          ),
        ],
      ),

      // bottomNavigationBar: BottomAppBar(
      //   color: kTitleColor,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       Icon(
      //         Icons.auto_graph,
      //         size: 40
      //       ),

      //       Icon(
      //         Icons.subject,
      //         size: 40
      //       ),
      //     ]
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Progress',
      //       backgroundColor: Colors.blue
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Workout Program',

      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'Report',
      //       backgroundColor: kTitleColor
      //     ),
      //   ],
      //   // currentIndex: _selectedIndex,
      //   selectedItemColor: kTitleColor
      // ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Progress',
            backgroundColor: kTitleColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Workout Program',
            backgroundColor: kTitleColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Report',
            backgroundColor: kTitleColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'General Information',
            backgroundColor: kTitleColor,
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: (){},
      ),
    );
  }
}