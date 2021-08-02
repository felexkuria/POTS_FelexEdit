import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pots_new/Screens/UserTests/stand_test.dart';
import 'package:pots_new/Screens/workout_page.dart';
import 'package:pots_new/helpers/databaseHelpers.dart';
import 'package:pots_new/models/patient.dart';
import '../../../constants.dart';
import 'package:flutter/material.dart';
import '../../Widgets/card.dart';
import 'supine_test.dart';

class Input extends StatefulWidget {
  // final double ageVal;
  // final double supineHR;
  // final double maxHR;

  // Input({required this.ageVal, required this.supineHR, required this.maxHR});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool isLoading = false;
  late Future<List<Map<String, Object?>>?>? _patientList;
  late Future<List<Patient>> patient;

  double age_val = 50;
  double supine_HR = 100;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //DatabaseHelper.instance.close();
    super.dispose();
  }

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
                    fontSize: 30))),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: ReusableCard(
                      cardChild: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Thank you for downloading the POTS app. Please follow the instructions to generate a personalized workout plan!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            wordSpacing: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      boxStyle: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadiusCard),
                          color: kTitleColor),
                    ),
                  ),
                  //age card
                  Expanded(
                    flex: 5,
                    //with the suppine hr button, the flex should be 3
                    child: ReusableCard(
                      boxStyle: generalStyle,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Age',
                                textAlign: TextAlign.center,
                                style: kCardTitleStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(age_val.toInt().toString(),
                                    style: kValStyle),
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
                            Text("SUPINE TEST",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20)),
                          ],
                        ),
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SupineTest(
                                age: age_val.toInt(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ));
  }
}
