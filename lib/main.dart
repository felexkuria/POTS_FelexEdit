import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'constants.dart';
import 'Screens/UserTests/input_page.dart';
import 'Screens/workout_page.dart';
import 'helpers/databaseHelpers.dart';
import 'models/patient.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshPatient();

    //updatePatientList();
  }

  bool isLoading = true;

Future <List<Map<String, Object?>>?>? _patientData;
  Future<List<Patient>>? patientList;
  Future refreshPatient() async {
    this._patientData =
        DatabaseHelper.instance.readAllPatientData()!.whenComplete(() {
          this.patientList = DatabaseHelper.instance.getPatientList();
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, Object?>>?>(
        future: DatabaseHelper.instance.readAllPatientData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  appBarTheme: AppBarTheme(color: kBackground),
                  scaffoldBackgroundColor: kBackground,
                ),
                home: Input(),
              );
            }
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(color: kBackground),
                scaffoldBackgroundColor: kBackground,
              ),
              home: SchedulePage(
                age: 0,
                suppineHr: 20,
                timedHr: 30,
              ),
            );
          }
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: kBackground),
              scaffoldBackgroundColor: kBackground,
            ),
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }
}
