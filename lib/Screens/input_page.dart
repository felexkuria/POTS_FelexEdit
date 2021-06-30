import 'package:flutter/cupertino.dart';
import 'package:pots_new/Screens/stand_test.dart';
import '../../constants.dart';
import 'package:flutter/material.dart';
import '../Widgets/card.dart';

class Input extends StatefulWidget {
  // final double ageVal;
  // final double supineHR;
  // final double maxHR;

  // Input({required this.ageVal, required this.supineHR, required this.maxHR});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  double age_val = 50;
  double supine_HR = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // centerTitle: false,
          elevation: 0,
          title: Text('POTS APP',
              style: TextStyle(
                  color: kTitleColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 40))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //intro card
          Expanded(
              flex: 3,
              child: ReusableCard(
                boxStyle: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kTitleColor),
                cardChild: Center(
                  child: Text("SOME INFO GOES HERE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          wordSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20)),
                ),
              )),

          //age card
          Expanded(
            flex: 5,
            //with the suppine hr button, the flex should be 3
            child: ReusableCard(
              boxStyle: generalStyle,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('AGE',
                        textAlign: TextAlign.center, style: kCardTitleStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(age_val.toInt().toString(), style: kValStyle),
                        Text('years')
                      ],
                    ),
                    Slider(
                      value: age_val,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      onChanged: (double value) {
                        setState(() {
                          age_val = value;
                        });
                      },
                      activeColor: kTitleColor,
                    ),
                  ]),
            ),
          ),

          //supine hr card
          // Expanded(
          //   flex: 3,
          //   child: ReusableCard(
          //     boxStyle: generalStyle,
          //     cardChild: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: <Widget>[
          //           Text('SITTING OR LYING HR',
          //               textAlign: TextAlign.center, style: kCardTitleStyle),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text(supine_HR.toInt().toString(), style: kValStyle),
          //               Text('bpm')
          //             ],
          //           ),
          //           Slider(
          //             value: supine_HR,
          //             min: 0,
          //             max: 200,
          //             divisions: 200,
          //             onChanged: (double value) {
          //               setState(() {
          //                 supine_HR = value;
          //               });
          //             },
          //             activeColor: kTitleColor,
          //           ),
          //         ]),
          //   ),
          // ),

          //stand test button
          Expanded(
            flex: 1,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: kTitleColor),
                child: GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("STAND TEST",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20)),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StandingTestPage(
                                    age: age_val,
                                    suppineHeartRate: supine_HR,
                                  )));
                    })),
          ),
        ],
      ),
    );
  }
}
