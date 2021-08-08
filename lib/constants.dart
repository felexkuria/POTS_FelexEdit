import 'package:flutter/material.dart';

const Color kBackground = Color(0xFFF2F2F2);
const Color kTitleColor = Color(0xFFD84654);

const int ageSubtractionConstants = 220;

const double borderRadiusCard = 15.0;

const double percentInHRR = .75;

const TextStyle kCardTitleStyle =
    TextStyle(color: kTitleColor, fontSize: 30, fontWeight: FontWeight.w900);

const TextStyle kValStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

final BoxDecoration generalStyle = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: Color(0xFFFFFFFF),
);
final BoxDecoration updatedCardStyle = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: kTitleColor,
);
const TextStyle kUpdateCardTitleStyle = TextStyle(
    color: Color(0xFFFFFFFF), fontSize: 30, fontWeight: FontWeight.w800);

const TextStyle kUpdateValStyle = TextStyle(
  fontSize: 25,
  color: Color(0xFFFFFFFF),
  fontWeight: FontWeight.w900,
);