
import 'package:flutter/material.dart';
import 'package:movies/style/colors.dart';

  ThemeData defaultTheme =  ThemeData(
   scaffoldBackgroundColor: defaultColor,

    appBarTheme:  AppBarTheme(
      color: defaultColor
    ),
    textTheme:const  TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      headline1:TextStyle(
        color: Colors.white,
        fontSize:14,
        fontWeight: FontWeight.w900,

      ),
      headline5: TextStyle(
        color: Colors.white,
        fontSize:12,
      ),
      headline6:  TextStyle(
        color: Colors.white,
        fontSize:8,
      ),

    ),

 );