import 'package:flutter/material.dart';
import 'Screens/UserTests/input_page.dart';
import 'Screens/UserTests/stand_test.dart';
import 'constants.dart';

class TargetHrCalculate{
  TargetHrCalculate({required this.age, required this.tenHr, required this.suppineHr});

  final int age;
  final int tenHr;
  final int suppineHr;

  //Calculation for Max HR with formula provided by docotr - int
  int maxHr(){
    return ageSubtractionConstants - age;
  }

  //Heart Rate Reserve Calculation - int
  int heartRateReserve(){
    return maxHr() - suppineHr;
  }

  double percentOfHRR(){
    return heartRateReserve() * .75;
  }

  double midMaxaxSteadyState(){
    return percentOfHRR()+suppineHr;
  }

  double RacePace(){
    return maxHr()* .95;
  }

}






