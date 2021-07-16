import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../constants.dart';
import '../../brains.dart';
import '../../Widgets/card.dart';

class PhaseTwo extends StatefulWidget {
  final TargetHrCalculate passedBrainObject;

  PhaseTwo({required this.passedBrainObject});

  @override
  _PhaseTwoState createState() => _PhaseTwoState();
}

class _PhaseTwoState extends State<PhaseTwo> {
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
              'Month 2,3',
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
  bool _isSelected = false;
  bool _weak1Phase1Val = false;
  bool _weak2Phase1Val = false;
  bool _weak3Phase1Val = false;
  bool _weak4Phase1Val = false;
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
                      "Progress Month 2,3",
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
          
          Padding(
            padding: const EdgeInsets.only(top: 50,),
            child: Text(
              "Month 2",
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w700,
                color: Colors.white
              )
            ),
          ),

          CheckboxListTile(
            checkColor: kTitleColor,
            activeColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 20, right: 75, left: 75),
            value: this._weak1Phase1Val,
            title: Text("Week 1",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onChanged: (_weak1Phase1Val) {
              setState(() {
                this._weak1Phase1Val = _weak1Phase1Val!;
              });
            },
          ),

          CheckboxListTile(
            checkColor: kTitleColor,
            activeColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 20, right: 75, left: 75),
            value: this._weak2Phase1Val,
            title: Text("Week 2",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onChanged: (_weak2Phase1Val) {
              setState(() {
                this._weak2Phase1Val = _weak2Phase1Val!;
              });
            },
          ),

          CheckboxListTile(
            checkColor: kTitleColor,
            activeColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 20, right: 75, left: 75),
            value: this._weak3Phase1Val,
            title: Text("Week 3",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onChanged: (_weak3Phase1Val) {
              setState(() {
                this._weak3Phase1Val = _weak3Phase1Val!;
              });
            },
          ),
          
          CheckboxListTile(
            checkColor: kTitleColor,
            activeColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 20, right: 75, left: 75),
            value: this._weak4Phase1Val,
            title: Text("Week 4",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onChanged: (_weak4Phase1Val) {
              setState(() {
                this._weak4Phase1Val = _weak4Phase1Val!;
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