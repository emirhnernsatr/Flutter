import 'package:flutter/material.dart';

class LightTheme{
  final _lightColor = _LightColor();

  late final ThemeData theme;

 LightTheme() {
    
  theme = ThemeData(
    appBarTheme: AppBarTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
    ),


    scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.green),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(onPrimary: Colors.purple, onSecondary: _LightColor().blueMenia)
    ),
    colorScheme: ColorScheme.light(),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.green), side: BorderSide(color: Colors.green)),
    
    textTheme: 
    ThemeData.light().textTheme.copyWith(titleLarge: TextStyle(fontSize: 24,color: _lightColor._textColor)));
 
 }
}

 class _LightColor {
    final Color _textColor = Color.fromARGB(255, 27, 26, 26);
    final Color blueMenia = Color.fromARGB(95, 188, 248, 1);
    
  }