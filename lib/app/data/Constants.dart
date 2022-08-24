import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static String connectionString = 'https://test.readingmonitor.co/api';
  static Color primaryColor = const Color(0xFF52C0A5);
  static Color secondaryColor = const Color(0xFF716259);
  static Color textColor = const Color(0xFF083A50);
  static String popins = "Popins";
  static String popinsbold = "PopinsBold";
  static const double padding =20;
  static const double avatarRadius =45;

  static showtoast(msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.green,
    );
  }
  static showtoastError(msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.red,
    );
  }

}