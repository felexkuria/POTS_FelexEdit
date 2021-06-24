import 'package:flutter/material.dart';
import 'Screens/input_page.dart';
import 'Screens/stand_test.dart';
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
    return heartRateReserve() * percentInHRR;
  }

  double midMaxaxSteadyState(){
    return percentOfHRR()+suppineHr;
  }

}






