import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../constants.dart';

class MonthsThreeToFive extends StatefulWidget {
  const MonthsThreeToFive({ Key? key }) : super(key: key);

  @override
  _MonthsThreeToFiveState createState() => _MonthsThreeToFiveState();
}

class _MonthsThreeToFiveState extends State<MonthsThreeToFive> {
  @override
  Widget build(BuildContext context) {
    return Material(
    child: SlidingUpPanel(
      backdropEnabled: true,
      panel: Center(
        child: Text("This is the sliding Widget"),
      ),
      body: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Months 3-5",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: kTitleColor
            )
          ),
        ),
        body:  Center(
          child: Text("This is the Widget behind the sliding panel"),
        ),
      ),
    ),
  );
  }
}