import 'package:flutter/material.dart';

class Style {
  static final baseTextStyle = TextStyle(
    fontFamily: 'Poppins',
  );

  static final regularTextStyle = baseTextStyle.copyWith(
    color: Color(0xffb6b2df),
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
  );

  static final subHeaderTextStyle = regularTextStyle.copyWith(
    fontSize: 12.0,
  );

  static final subHeaderTextBoldStyle = regularTextStyle.copyWith(
    color: Colors.white,
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
  );

  static final headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );
}
