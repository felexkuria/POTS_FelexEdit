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
            child: ReusableCard(
              boxStyle: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              cardChild: Center(
                child: Text(
                  widget.monthName,
                  style: kCardTitleStyle,
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