import 'package:flutter/material.dart';

Widget createDrawerHeader() {
  return const DrawerHeader(
      margin: EdgeInsets.zero,
      //padding: EdgeInsets.symmetric(vertical: 110),
      decoration: BoxDecoration(
        color: Color(0xFF6EB7A1),
          image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/RMLogowhite.png',)
          )
      ), child: null,

  )
  ;
}