import 'package:flutter/material.dart';
import 'Screens/input_page.dart';
import 'Screens/stand_test.dart';

class HrCalculate{
  HrCalculate({required this.age, required this.tenHr, required this.suppineHr});

  int age;
  int tenHr;
  int suppineHr;

  //Calculation for Max HR with formula provided by docotr - int
  int maxHr(){
    return 220-age;
  }

  //Heart Rate Reserve Calculation - int
  int heartRateReserve(){
    return maxHr() - suppineHr;
  }

  double seventyFiveOfHRR(){
    return heartRateReserve()*.75;
  }

  double midMaxaxSteadyState(){
    return seventyFiveOfHRR()+suppineHr;
  }
  
}





