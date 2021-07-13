import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../constants.dart';
import '../../brains.dart';
import '../../Widgets/card.dart';

class SectionOne extends StatefulWidget {
  final TargetHrCalculate passedBrainObject;

  SectionOne({required this.passedBrainObject});

  @override
  _SectionOneState createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
  // ignore: deprecated_member_use
  var isCheckedList = [false, false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    TargetHrCalculate usedInScreen = widget.passedBrainObject;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'MONTH 1',
          style: TextStyle(
            color: kTitleColor,
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  boxStyle: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadiusCard),
                    color: Colors.white,
                  ),
                  cardChild: Center(
                    child: Text(
                      "Workout Info",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        wordSpacing: 1,
                        color: kTitleColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                      ),
                    ),
                    // child: CheckboxListTile(
                    //   title: const Text('Animate Slowly'),
                    //   value: true,
                    //   onChanged: (bool? value) {
                    //     setState(() {});
                    //   },
                    //   secondary: const Icon(Icons.hourglass_empty),
                    // ),
                  ),
                ),
              ),
            ],
          ),
          SlidingUpPanel(
            renderPanelSheet: false,
            maxHeight: 750, //make sure to
            panel: _floatingPanel(),
            collapsed: _floatingCollapsed(),
          ),
        ],
      ),
    );
  }
}

//functions which modify the floating and collapsed slide up widget
Widget _floatingCollapsed() {
  return Container(
    decoration: BoxDecoration(
      color: kTitleColor,
      // borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadiusCard), topRight: Radius.circular(borderRadiusCard)),
    ),
    // margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Container(
          //   width:40,
          //   height: 7,
          //   child: Text("                 "),
          //   decoration: BoxDecoration(
          //     color: Colors.grey,
          //     borderRadius: BorderRadius.all(Radius.circular(8.0))
          //   )
          // ),

          Text(
            "Progress Tab",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ],
      ),
    ),
  );
}

Widget _floatingPanel() {
  return Container(
    decoration: BoxDecoration(
        color: kTitleColor,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.grey,
          ),
        ]),
    margin: const EdgeInsets.all(15.0),
    child: Center(
      child: Text("This is the SlidingUpPanel when open"),
    ),
  );
}

//if they complete 75% of the workouts then they can move onto the next set of months

/*
month 1: we will do anly BASE PACE
month2: patients will be exercising 




phase 1: base pace workouts 
phase 2: chose between # of base pace workouts, 
*/