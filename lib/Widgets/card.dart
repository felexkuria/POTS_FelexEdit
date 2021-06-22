import 'package:flutter/material.dart';
import '../Screens/input_page.dart';

class ReusableCard extends StatelessWidget {
  
  final Widget cardChild;
  final BoxDecoration boxStyle;
  
  ReusableCard({required this.cardChild, required this.boxStyle});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxStyle,
      margin: EdgeInsets.all(15),
      child: cardChild
    );
  }
}