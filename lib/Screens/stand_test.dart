import 'dart:math';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import '../../constants.dart';
import '../Widgets/card.dart';
import 'package:timer_count_down/timer_count_down.dart';

class InputPageTwo extends StatefulWidget {
  const InputPageTwo({Key? key}) : super(key: key);

  @override
  _InputPageTwoState createState() => _InputPageTwoState();
}

class _InputPageTwoState extends State<InputPageTwo> {
  final CountdownController _controller = new CountdownController();
  double age_val = 50;
  double restingRateval = 130;
  double maxHeartRate = 130;
  int minutes = 0;
  int seconds = 0;
  int standingTestFlex = 8;
  bool isVisible = false;
  bool generateWorkoutIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // centerTitle: false,
          elevation: 0,
          title: Text('POTS',
              style: TextStyle(
                  color: kTitleColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 40))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: standingTestFlex,
            child: ReusableCard(
              boxStyle: generalStyle,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("STANDING TEST TIMER", style: kCardTitleStyle),
                  Countdown(
                    controller: _controller,
                    seconds: 5,
                    build: (_, double time) => Text(
                      minutesAndSeconds(time),
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 50,
                      ),
                    ),
                    interval: Duration(milliseconds: 100),
                    onFinished: () {
                      setState(() {
                        isVisible = true;
                        standingTestFlex = 4;
                        generateWorkoutIsVisible = true;
                      });
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text('Timer is done!'),
                      //   ),
                      // );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Start
                        ElevatedButton(
                            child: Text('Start'),
                            onPressed: () {
                              _controller.start();
                            },
                            style:
                                ElevatedButton.styleFrom(primary: kTitleColor)),
                        // Pause
                        ElevatedButton(
                            child: Text('Pause'),
                            onPressed: () {
                              _controller.pause();
                            },
                            style:
                                ElevatedButton.styleFrom(primary: kTitleColor)),
                        // Resume
                        ElevatedButton(
                            child: Text('Resume'),
                            onPressed: () {
                              _controller.resume();
                            },
                            style:
                                ElevatedButton.styleFrom(primary: kTitleColor)),
                        // Stop
                        ElevatedButton(
                            child: Text('Restart'),
                            onPressed: () {
                              _controller.restart();
                            },
                            style:
                                ElevatedButton.styleFrom(primary: kTitleColor)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Visibility(
            visible: isVisible,
            child: Expanded(
              flex: 4,
              child: ReusableCard(
                boxStyle: generalStyle,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('HR AFTER 10 MINTES OF STANDING',
                          textAlign: TextAlign.center, style: kCardTitleStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(restingRateval.toInt().toString(),
                              style: kValStyle),
                          Text('b/m')
                        ],
                      ),
                      AbsorbPointer(
                        absorbing: false,
                        child: Slider(
                          value: restingRateval,
                          min: 0,
                          max: 250,
                          divisions: 250,
                          onChanged: (double value) {
                            setState(() {
                              restingRateval = value;
                            });
                          },
                          activeColor: kTitleColor,
                        ),
                      ),
                    ]),
              ),
            ),
          ),

          // Expanded(
          //   flex: 2,
          //   child: ReusableCard(
          //     boxStyle: generalStyle,
          //     cardChild: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: <Widget>[
          //           Text('MAX HR', style: kCardTitleStyle),
          //           Text("Do You know your max HR?"),
          //           Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: <Widget>[
          //                 ElevatedButton(
          //                   style:
          //                       ElevatedButton.styleFrom(primary: kTitleColor),
          //                   child: Text("YES"),
          //                   onPressed: () {},
          //                 ),
          //                 ElevatedButton(
          //                     style: ElevatedButton.styleFrom(
          //                         primary: kTitleColor),
          //                     child: Text("NO"),
          //                     onPressed: () {})
          //               ]),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text(maxHeartRate.toInt().toString(), style: kValStyle),
          //               Text('b/m')
          //             ],
          //           ),
          //           AbsorbPointer(
          //             absorbing: absordMaxHR,
          //             child: Slider(
          //               value: maxHeartRate,
          //               min: 0,
          //               max: 250,
          //               divisions: 250,
          //               onChanged: (double value) {
          //                 setState(() {
          //                   maxHeartRate = value;
          //                 });
          //               },
          //               activeColor: kTitleColor,
          //             ),
          //           ),
          //         ]),
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     width: double.infinity,
          //     color: kTitleColor,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         GestureDetector(
          //           child: Text(
          //             "LETS GET STARTED!",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //               color: kBackground,
          //               fontWeight: FontWeight.w900,
          //               fontSize: 25
          //             ),
          //           ),
          //           onTap: (){
          //             Navigator.pushNamed(context, '/inputPage2');
          //           },
          //         ),
          //       ],
          //     )
          //   ),
          // )
          Visibility(
            visible: generateWorkoutIsVisible,
            child: Expanded(
              flex: 1,
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: kTitleColor),
                  child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("GENERATE WORKOUT",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20)),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/schedulePage');
                      })),
            ),
          ),
        ],
      ),
    );
  }
}

//Formats the time given by the timer package
String minutesAndSeconds(double time) {
  String minutes;
  String seconds;

  minutes = (time ~/ 60).toInt().toString();
  seconds = (time % 60).toInt().toString();

  if (seconds.length == 1) {
    seconds = "0" + seconds;
  }

  String returnedString = minutes + ":" + seconds;

  return (returnedString);
}
