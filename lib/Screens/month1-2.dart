import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../constants.dart';
import '../brains.dart';
import '../Widgets/card.dart';

class MonthsOneAndTwo extends StatefulWidget {
  final TargetHrCalculate passedBrainObject;

  MonthsOneAndTwo({required this.passedBrainObject});

  @override
  _MonthsOneAndTwoState createState() => _MonthsOneAndTwoState();
}

class _MonthsOneAndTwoState extends State<MonthsOneAndTwo> {
  // ignore: deprecated_member_use
  var isCheckedList = [false, false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'MONTHS 1-2',
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
                    borderRadius: BorderRadius.circular(10.0),
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
              // Expanded(
              //     child: ReusableCard(
              //   boxStyle: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              //   cardChild: Center(
              //     child: Column(children: <Widget>[
              //       Text(
              //         "Progress Panel",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           wordSpacing: 1,
              //           color: kTitleColor,
              //           fontWeight: FontWeight.w900,
              //           fontSize: 20,
              //         ),
              //       ),

              //     ]),
              //   ),
              // ))
            ],
          ),
          SlidingUpPanel(
            renderPanelSheet: false,
            panel: _floatingPanel(),
            collapsed: _floatingCollapsed(),
          ),
        ],
      ),
    );
  }
}

Widget _floatingCollapsed(){
  return Container(
    decoration: BoxDecoration(
      color: kTitleColor,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
    ),
    margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
    child: Center(
      child: Text(
        "Progress Tab",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20
        ),
      ),
    ),
  );
}

Widget _floatingPanel(){
  return Container(
    decoration: BoxDecoration(
      color: kTitleColor,
      borderRadius: BorderRadius.all(Radius.circular(24.0)),
      boxShadow: [
        BoxShadow(
          blurRadius: 20.0,
          color: Colors.grey,
        ),
      ]
    ),
    margin: const EdgeInsets.all(15.0),
    child: Center(
      child: Text("This is the SlidingUpPanel when open"),
    ),
  );
}