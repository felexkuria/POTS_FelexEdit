import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pots_new/Widgets/pageViewCarousel.dart';
import 'package:pots_new/helpers/databaseHelpers.dart';

import '../../constants.dart';
import '../workout_page.dart';

class UpdateScreen extends StatefulWidget {
  final int age;

  final int suppineHr;
  final int timedHr;

  const UpdateScreen(
      {required this.age, required this.suppineHr, required this.timedHr});

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  PageController? _agePageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agePageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              //await DatabaseHelper.instance.close();
              Get.to(() => SchedulePage(
                    suppineHr: widget.suppineHr,
                    age: widget.age,
                    timedHr: widget.timedHr,
                  ));
            },
            icon: Icon(
              CupertinoIcons.clear_thick,
              color: kTitleColor,
              size: 30.0,
            )),
      ),
      body: StreamBuilder(
          stream: DatabaseHelper.instance.readAllPatientData()?.asStream(),
          builder: (context, snapshot) {
            return PageViewCarousel(
              pageController: _agePageController!,
              title: "",
              age: widget.age,
              timedHr: widget.timedHr,
              suppineHr: widget.suppineHr,
            );
          }),
    );
  }
}
