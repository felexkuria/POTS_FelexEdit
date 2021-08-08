import 'package:flutter/material.dart';
import 'package:pots_new/helpers/databaseHelpers.dart';
import 'package:pots_new/models/patient.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../constants.dart';

//works to hide and unhide the bottom button and the HR after 10 minutes
bool isVisible = false;
bool generateWorkoutIsVisible = false;

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

class PageViewCarousel extends StatefulWidget {
  final PageController pageController;
  final String title;
  final int age;

  final int suppineHr;
  final int timedHr;

  // final List<Patient> patients;
  const PageViewCarousel({
    required this.pageController,
    required this.title,
    required this.age,
    required this.suppineHr,
    required this.timedHr,
  });

  @override
  _PageViewCarouselState createState() => _PageViewCarouselState();
}

class _PageViewCarouselState extends State<PageViewCarousel> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // refreshAndCreatePatient();
    //refreshAndUpdatePatient();
  }

  Future<List<Map<String, Object?>>?>? _patientData;
  Future<List<Patient>?>? patientList;

  // final int slideAge;
  // final int supineHeart;
  // final int standHr;
  double slideAge = 34;
  double supine_HR = 100;
  double standHR = 100;
  int standingTestFlex = 8;

  // Future  refreshAndUpdatePatient(int age, int suppineHr,int standhr) async{
  //
  //  }

  Future refreshAndCreatePatient() async {
    this._patientData =
        DatabaseHelper.instance.readAllPatientData()!.whenComplete(() {
      this.patientList = DatabaseHelper.instance.getPatientList();
      setState(() {});
    });
    // refreshAndUpdatePatient();
  }

  Widget _buildCarousel(BuildContext context, int index, data, ageFromDb) {
    //final patient=patients[index];

    var currentPageValue = 0.0;
    final CountdownController _controller = new CountdownController();
    final CountdownController _controllerSuppineTest =
        new CountdownController();
    return AnimatedBuilder(
      animation: widget.pageController,
      builder: (BuildContext context, Widget? child) {
        double value = 1.0;
        if (widget.pageController.position.haveDimensions) {
          value = (widget.pageController.page! - index);
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        if (index == currentPageValue.floor()) {
          return Center(
            child: SizedBox(
              height: Curves.easeIn.transform(value) * 1000,
              child: Column(children: [
                Container(
                  decoration: updatedCardStyle,
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(12),
                  child: Center(
                    child: Column(children: <Widget>[
                      Text("Age ",
                          textAlign: TextAlign.center,
                          style: kUpdateCardTitleStyle),
                      SizedBox(
                        height: 70.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(data[0]["age"].toString(),
                              style: kUpdateValStyle),
                          Text('Yrs',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 70.0,
                      ),
                      Slider(
                        label: slideAge.toStringAsFixed(0),
                        value: slideAge,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        onChanged: (double value) {
                          setState(() {
                            slideAge = value;
                          });
                        },
                        activeColor: Colors.white,
                        inactiveColor: Colors.white,
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                    ]),
                  ),
                ),
                //SizedBox(height: 20,),
                TextButton(
                    child: Text(
                      'Done',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(right: 16, left: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),

                      primary: kTitleColor,
                      //minimumSize:Size(10,20) ,
                    )),
              ]),
            ),
          );
        } else if (index == currentPageValue.floor() + 1) {
          return Center(
            child: SizedBox(
              height: Curves.easeIn.transform(value) * 1000,
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: updatedCardStyle,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(12),
                      child: Center(
                        child: Column(children: <Widget>[
                          Text('Suppine   Test',
                              textAlign: TextAlign.center,
                              style: kUpdateCardTitleStyle),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Lay Down And Click Start When Ready',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Countdown(
                            controller: _controllerSuppineTest,
                            seconds: 600,
                            build: (_, double time) => Text(
                              minutesAndSeconds(time),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
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
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // Start
                                TextButton(
                                    child: Text(
                                      'Start',
                                      style: TextStyle(color: kTitleColor),
                                    ),
                                    onPressed: () {
                                      _controllerSuppineTest.start();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(0, 20),
                                      primary: Colors.white,
                                    )),
                                SizedBox(
                                  width: 10.0,
                                ),
                                // Pause
                                TextButton(
                                    child: Text(
                                      'Pause',
                                      style: TextStyle(color: kTitleColor),
                                    ),
                                    onPressed: () {
                                      _controllerSuppineTest.pause();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      minimumSize: Size(0, 20),
                                    )),
                                SizedBox(
                                  width: 10.0,
                                ),
                                // Resume
                                TextButton(
                                    child: Text(
                                      'Resume',
                                      style: TextStyle(color: kTitleColor),
                                    ),
                                    onPressed: () {
                                      _controllerSuppineTest.resume();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      minimumSize: Size(0, 20),
                                    )),
                                // Stop
                                SizedBox(
                                  width: 10.0,
                                ),
                                TextButton(
                                    child: Text(
                                      'Restart',
                                      style: TextStyle(color: kTitleColor),
                                    ),
                                    onPressed: () {
                                      _controllerSuppineTest.restart();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      minimumSize: Size(0, 20),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${supine_HR.toStringAsFixed(0)}",
                                  style: kUpdateValStyle),
                              Text('bpm',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Slider(
                            value: supine_HR,
                            min: 0,
                            max: 250,
                            divisions: 250,
                            onChanged: (double value) {
                              setState(() {
                                supine_HR = value;
                              });
                            },
                            activeColor: Colors.white,
                            inactiveColor: Colors.white,
                          ),
                        ]),
                      ),
                    ),
                    //SizedBox(height: 20,),
                    TextButton(
                        child: Text(
                          'Done',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(right: 16, left: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),

                          primary: kTitleColor,
                          //minimumSize:Size(10,20) ,
                        )),
                  ]),
            ),
          );
        } else {
          return Center(
            child: SizedBox(
              height: Curves.easeIn.transform(value) * 1000,
              child: Column(children: [
                Container(
                  decoration: updatedCardStyle,
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(12),
                  child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Stand  Test',
                            textAlign: TextAlign.center,
                            style: kUpdateCardTitleStyle),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Stand Up And Click Start When Ready',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Countdown(
                          controller: _controller,
                          seconds: 600,
                          build: (_, double time) => Text(
                            minutesAndSeconds(time),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
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
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Start
                              TextButton(
                                  child: Text(
                                    'Start',
                                    style: TextStyle(color: kTitleColor),
                                  ),
                                  onPressed: () {
                                    _controller.start();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(0, 20),
                                    primary: Colors.white,
                                  )),
                              SizedBox(
                                width: 10.0,
                              ),
                              // Pause
                              TextButton(
                                  child: Text(
                                    'Pause',
                                    style: TextStyle(color: kTitleColor),
                                  ),
                                  onPressed: () {
                                    _controller.pause();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    minimumSize: Size(0, 20),
                                  )),
                              SizedBox(
                                width: 10.0,
                              ),
                              // Resume
                              TextButton(
                                  child: Text(
                                    'Resume',
                                    style: TextStyle(color: kTitleColor),
                                  ),
                                  onPressed: () {
                                    _controller.resume();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    minimumSize: Size(0, 20),
                                  )),
                              // Stop
                              SizedBox(
                                width: 10.0,
                              ),
                              TextButton(
                                  child: Text(
                                    'Restart',
                                    style: TextStyle(color: kTitleColor),
                                  ),
                                  onPressed: () {
                                    _controller.restart();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    minimumSize: Size(0, 20),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${standHR.toStringAsFixed(0)}",
                                style: kUpdateValStyle),
                            Text('bpm',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Slider(
                          value: standHR,
                          min: 0,
                          max: 250,
                          divisions: 250,
                          onChanged: (double value) {
                            setState(() {
                              standHR = value;
                            });
                          },
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                        ),
                      ]),
                ),
                //SizedBox(height: 20,),
                Builder(
                    builder: (context) => TextButton(
                        child: Text(
                          'Done',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        onPressed: () async {
                          DatabaseHelper.instance
                              .update(
                                  status: standHR.toInt(),
                                  suppineHr: supine_HR.toInt(),
                                  age: slideAge.toInt())
                              .whenComplete(() {
                            setState(() {});
                            print("status");
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(right: 16, left: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),

                          primary: kTitleColor,
                          //minimumSize:Size(10,20) ,
                        ))),
              ]),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return FutureBuilder<List<Map<String, Object?>>?>(
        future: DatabaseHelper.instance.readAllPatientData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height - 230,
                  child: PageView.builder(
                    controller: widget.pageController,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      final data = snapshot.data;
                      final age_val = snapshot.data;
                      //final patientLists=patientList![index];

                      return _buildCarousel(context, index, data, age_val);
                    },
                  ),
                ),
              ],
            );
          }
          return Text("Sqlfite Data Has Been And Database Closed");
        });
  }
}
