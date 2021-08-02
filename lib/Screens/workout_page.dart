import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pots_new/Screens/MonthlyWorkoutFiles/PhaseOneScreens/monthOne.dart';
import 'package:pots_new/helpers/databaseHelpers.dart';
import 'package:pots_new/models/patient.dart';
import '../brains.dart';
import '../Widgets/progress.dart';
import '../constants.dart';
import '../Widgets/card.dart';
import 'MonthlyWorkoutFiles/PhaseTwoScreens/monthThree.dart';
import 'MonthlyWorkoutFiles/PhaseTwoScreens/monthTwo.dart';
import 'MonthlyWorkoutFiles/PhaseThreeScreens/monthFour.dart';
import 'MonthlyWorkoutFiles/PhaseThreeScreens/monthFive.dart';
import 'MonthlyWorkoutFiles/PhaseThreeScreens/monthSix.dart';
import '/Widgets/monthCard.dart';

//Design One: The First UI with the month based System

// //Phase 1: Month 1
// //Phase 2: Month 2,3
// //Pahse 3: Month 4,5,6

class SchedulePage extends StatefulWidget {
  SchedulePage(
      {required this.age, required this.suppineHr, required this.timedHr});
  final int age;

  final int suppineHr;
  final int timedHr;
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late Future<List<Map<String, Object?>>?>? _patientData;
  late Future<List<Patient>?>? patientList;

  @override
  void dispose() {
    // TODO: implement dispose
    //DatabaseHelper.instance.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    refereshAndCreatePatient();
    //updatePatientList();
  }

  // ss
  Future refereshAndCreatePatient() async {
    this._patientData =
        DatabaseHelper.instance.readAllPatientData()!.whenComplete(() {
      this.patientList = DatabaseHelper.instance.getPatientList();
      setState(() {});
    });

    Patient patient = Patient(
        // id: autoIncrement,
        age: widget.age,
        supineHeartRate: widget.suppineHr,
        isChecked: 0,
        status: widget.timedHr);
    DatabaseHelper.instance.createPatient(patient).whenComplete(() {
      setState(() {});
      //print(patient.id);
    });
  }

  @override
  // DateTime now = new DateTime.now();
  Widget build(BuildContext context) {
    final int age = widget.age;
    final int suppineHr = widget.suppineHr;
    final int timedHr = widget.timedHr;
    TargetHrCalculate provider =
        new TargetHrCalculate(age: age, tenHr: timedHr, suppineHr: suppineHr);
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () async {
                  // Navigator.pop(context);
                  await DatabaseHelper.instance.delete(10).whenComplete(() {
                    setState(() {});
                  });
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.black,
                )),
            elevation: 0,
            title: Text("'POTS APP'",
                style: TextStyle(
                    color: kTitleColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 30))),
        body: FutureBuilder(
            future: DatabaseHelper.instance.readAllPatientData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasData) {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = snapshot.data[index];
                    return Container(
                      color: kTitleColor,
                      child: Center(
                        child: Text("age ${data["age"]}",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    );
                  },
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SizedBox(
          height: double.infinity, // card height
          width: double.infinity,
          child: PageView.builder(
            itemCount: 10,
            controller: PageController(viewportFraction: 0.7),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                child: ReusableCard(
                  boxStyle: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadiusCard),
                    color: Colors.white,
                  ),
                  // elevation: 6,
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  cardChild: Center(
                    child: Text(
                      "Card ${i + 1}",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
