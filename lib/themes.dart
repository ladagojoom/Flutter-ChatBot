import 'package:flutter/material.dart';

class FontSize {
  static const extraSmall = 14.0;
  static const small = 16.0;
  static const standard = 18.0;
  static const large = 20.0;
  static const extraLarge = 24.0;
  static const doubleExtraLarge = 26.0;
}

//theme of context
ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    ,
   colorScheme: ColorScheme.light(
      background: Color(0xffffffff) ,
      primary: Color(0xff3369FF),
      secondary: Color(0xffffffff)
   ),
   textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors(0xff000000))
   )
);



ThemeData darktmode = ThemeData(
   brightness: Brightness.dark,
   colorScheme: ColorScheme.dark(
      background: Color(0xff000000) ,
      primary: Color(0xff3369FF),
      secondary: Color(0xffffffff)
   ),
   textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors(0xffffffff))
   
   )
);
