import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.deepOrange
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 30,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.deepOrange,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.white,
    elevation: 5,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.deepOrange,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  ),

) ;

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('#1c1d1f'),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.deepOrangeAccent
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 30,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.deepOrange,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('#1c1d1f'),
    elevation: 5,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('#1c1d1f'),
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 10,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),

);