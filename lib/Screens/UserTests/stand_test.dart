import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import '../../../constants.dart';
import '../../Widgets/card.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../workout_page.dart';

class StandingTestPage extends StatefulWidget {
  StandingTestPage({required this.age, required this.suppineHeartRate});
  final double age;
  final double suppineHeartRate;

  @override
  _StandingTestPageState createState() => _StandingTestPageState();
}

class _StandingTestPageState extends State<StandingTestPage> {
  final CountdownController _controller = new CountdownController();
  //HR after 10 minutes
  int tenMinuteHR = 130;

  //variables required for the minutes and seconds
  int minutes = 0;
  int seconds = 0;

  int standingTestFlex = 8;

  //works to hide and unhide the bottom button and the HR after 10 minutes
  bool isVisible = false;
  bool generateWorkoutIsVisible = false;

  //assigning variables from object something to values

  @override
  Widget build(BuildContext context) {
    //variables which repersent the
    int age = widget.age.toInt();
    int suppineHr = widget.suppineHeartRate.toInt();

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
            flex: standingTestFlex,
            child: ReusableCard(
              boxStyle: generalStyle,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Stand Up And Click Start When Ready",
                    textAlign: TextAlign.center,
                    style: kCardTitleStyle,
                  ),
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
                      Text('HR After 10 Minutes Of Standing',
                          textAlign: TextAlign.center, style: kCardTitleStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(tenMinuteHR.toInt().toString(),
                              style: kValStyle),
                          Text('b/m')
                        ],
                      ),
                      AbsorbPointer(
                        absorbing: false,
                        child: Slider(
                          value: tenMinuteHR.toDouble(),
                          min: 0,
                          max: 250,
                          divisions: 250,
                          onChanged: (double value) {
                            setState(() {
                              tenMinuteHR = value.toInt();
                            });
                          },
                          activeColor: kTitleColor,
                        ),
                      ),
                    ]),
              ),
            ),
          ),

          //Generate Workout Button
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
                          Text("Generate Workout",
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
                                builder: (context) => SchedulePage(
                                      age: age,
                                      suppineHr: suppineHr,
                                      timedHr: tenMinuteHR,
                                    )));
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
