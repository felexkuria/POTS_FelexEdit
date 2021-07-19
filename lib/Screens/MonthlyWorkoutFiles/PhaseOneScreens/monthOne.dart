import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../constants.dart';
import '../../../brains.dart';
import '../../../Widgets/card.dart';

class MonthOne extends StatefulWidget {
  final TargetHrCalculate passedBrainObject;

  MonthOne({required this.passedBrainObject});

  @override
  _MonthOneState createState() => _MonthOneState();
}

class _MonthOneState extends State<MonthOne> {
  // ignore: deprecated_member_use
  var isCheckedList = [false, false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {

    TargetHrCalculate usedInScreen = widget.passedBrainObject;

    return Material(
      child: SlidingUpPanel(
        backdropEnabled: true,
        renderPanelSheet: false,
        maxHeight: 750, //make sure to
        panel: opened(),
        collapsed: _floatingCollapsed(),
        body: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Month 1',
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      cardChild: Column(
                        children: [
                          Text("Reccomended Exercises"),
                          Text("Rowing, Swimming, Inclined Biking")
                        ],
                      ),
                      boxStyle: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadiusCard),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ReusableCard(
                      boxStyle: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadiusCard),
                        color: Colors.white,
                      ),
                      cardChild: Center(
                          child: Column(
                        children: [
                          Text("Exercise Information"),
                        ],
                      )
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
                // slideDirection: SlideDirection.DOWN,
                renderPanelSheet: false,
                maxHeight: 750, //make sure to
                panel: opened(),
                collapsed: _floatingCollapsed(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class opened extends StatefulWidget {
  const opened({Key? key}) : super(key: key);

  @override
  _openedState createState() => _openedState();
}

class _openedState extends State<opened> {
  List<bool> phaseOne = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kTitleColor,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Colors.grey,
            ),
          ]),
      margin: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 5),
                    height: 5,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // color: Color(0xFFFFFF),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Progress Month 1",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CheckboxListTile(
            checkColor: kTitleColor,
            activeColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 50, right: 75, left: 75),
            value: phaseOne[0],
            title: Text("Week 1",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onChanged: (something) {
              setState(() {
                this.phaseOne[0] = something!;
              });
            },
          ),
          CheckboxListTile(
            checkColor: kTitleColor,
            activeColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 20, right: 75, left: 75),
            value: this.phaseOne[1],
            title: Text("Week 2",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onChanged: (something) {
              setState(() {
                this.phaseOne[1] = something!;
              });
            },
          ),
          CheckboxListTile(
            checkColor: kTitleColor,
            activeColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 20, right: 75, left: 75),
            value: this.phaseOne[2],
            title: Text("Week 3",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onChanged: (something) {
              setState(() {
                this.phaseOne[2] = something!;
              });
            },
          ),
          CheckboxListTile(
            checkColor: kTitleColor,
            activeColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 20, right: 75, left: 75),
            value: this.phaseOne[3],
            title: Text("Week 4",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onChanged: (something) {
              setState(() {
                this.phaseOne[3] = something!;
              });
            },
          )
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
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 5,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // color: Color(0xFFFFFF),
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
          Center(
            child: Text(
              "Progress Tab",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ),
        ],
      ),
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