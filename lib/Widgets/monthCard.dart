import 'package:flutter/material.dart';
import '../constants.dart';
import 'card.dart';

class MonthCard extends StatefulWidget {
  final String monthName;
  final Widget namedRoute;

  MonthCard({required this.monthName, required this.namedRoute});

  @override
  _MonthCardState createState() => _MonthCardState();
}

class _MonthCardState extends State<MonthCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          child: Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 15, left: 15, top: 10),
              height:100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,),
              child: Center(
                child: Text(
                  widget.monthName,
                  style: TextStyle(
                    color: kTitleColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700
                  )
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => widget.namedRoute));
          }),
    );
  }
}