import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../Widgets/card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../brains.dart';

class MonthThree extends StatefulWidget {
  final TargetHrCalculate passedBrainObject;
  MonthThree({required this.passedBrainObject});

  @override
  _MonthThreeState createState() => _MonthThreeState();
}

class _MonthThreeState extends State<MonthThree> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SlidingUpPanel(
      renderPanelSheet: false,

      backdropEnabled: true,
      maxHeight: 750, //make sure to
      panel: opened(),
      collapsed: _floatingCollapsed(),

      body: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Month 3',
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
                    ),
                  ),
                ),
              ],
            ),
            SlidingUpPanel(
              renderPanelSheet: false,
              backdropEnabled: true,
              maxHeight: 750, //make sure to
              panel: opened(),
              collapsed: _floatingCollapsed(),
            ),
          ],
        ),
      ),
    ));
  }
}

//functions which modify the floating and collapsed slide up widget
Widget _floatingCollapsed() {
  return Container(
    decoration: BoxDecoration(
      color: kTitleColor,
    ),
    child: Center(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 5,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
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

Widget _floatingPanel() {
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
                  height: 5,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Progress Months 4-6",
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
      ],
    ),
  );
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
                      "Progress Months 4,5,6",
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
              "Month 4",
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
