import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appLightTheme = ThemeData(
  fontFamily: "Cairo",
  primaryColor: AppColors.primaryColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    titleTextStyle:  TextStyle(
      color: AppColors.black,
      fontFamily: "Cairo",

    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
    ),
    elevation: 0,
    centerTitle: true,

  ),
  // backgroundColor: AppColors.white,
  scaffoldBackgroundColor: AppColors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
  ),

  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColors.black,
    ),
    headline2: TextStyle(
      height: 2,
      color: AppColors.grey,
      fontSize: 19,
    ),
    bodyText1: TextStyle(
      height: 2,
      color: AppColors.grey,
      fontSize: 19,
    ),
    bodyText2: TextStyle(
      height: 1.8,
      color: AppColors.grey,
      fontSize: 17,
    ),
  ),

);


class Themes {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600
          ),
          iconTheme: const IconThemeData(
              color: Colors.black
          ),
          backgroundColor: Colors.grey.shade50,
          elevation: 0
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
          ),
          hintStyle: const TextStyle(
            fontSize: 14,
          )
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.red
      ),
      textTheme: TextTheme(
          headline1: const TextStyle(
              letterSpacing: -1.5,
              fontSize: 48,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
          headline2: const TextStyle(
              letterSpacing: -1.0,
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
          headline3: const TextStyle(
              letterSpacing: -1.0,
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
          headline4: const TextStyle(
              letterSpacing: -1.0,
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w600
          ),
          headline5: const TextStyle(
              letterSpacing: -1.0,
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500
          ),
          headline6: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
          subtitle1: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
          subtitle2: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500
          ),
          bodyText1: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
              fontWeight: FontWeight.w400
          ),
          bodyText2: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w400
          ),
          button: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600
          ),
          caption: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 12,
              fontWeight: FontWeight.w400
          ),
          overline: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.5
          )
      )
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blue,
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor:AppColors.grey,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.grey,
      elevation: 0,
      iconTheme: IconThemeData(
          color: Colors.white
      ),
    ),
    bottomAppBarColor: AppColors.grey,
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)
        ),
        hintStyle: const TextStyle(
          fontSize: 14,
        )
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
            letterSpacing: -1.5,
            fontSize: 48,
            color: Colors.grey.shade50,
            fontWeight: FontWeight.bold
        ),
        headline2: TextStyle(
            letterSpacing: -1.0,
            fontSize: 40,
            color: Colors.grey.shade50,
            fontWeight: FontWeight.bold
        ),
        headline3: TextStyle(
            letterSpacing: -1.0,
            fontSize: 32,
            color: Colors.grey.shade50,
            fontWeight: FontWeight.bold
        ),
        headline4: TextStyle(
            letterSpacing: -1.0,
            color: Colors.grey.shade50,
            fontSize: 28,
            fontWeight: FontWeight.w600
        ),
        headline5: TextStyle(
            letterSpacing: -1.0,
            color: Colors.grey.shade50,
            fontSize: 24,
            fontWeight: FontWeight.w500
        ),
        headline6: TextStyle(
            color: Colors.grey.shade50,
            fontSize: 18,
            fontWeight: FontWeight.w500
        ),
        subtitle1: TextStyle(
            color: Colors.grey.shade50,
            fontSize: 16,
            fontWeight: FontWeight.w500
        ),
        subtitle2: TextStyle(
            color: Colors.grey.shade50,
            fontSize: 14,
            fontWeight: FontWeight.w500
        ),
        bodyText1: TextStyle(
            color: Colors.grey.shade50,
            fontSize: 16,
            fontWeight: FontWeight.w400
        ),
        bodyText2: TextStyle(
            color: Colors.grey.shade50,
            fontSize: 14,
            fontWeight: FontWeight.w400
        ),
        button: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600
        ),
        caption: TextStyle(
            color: Colors.grey.shade50,
            fontSize: 12,
            fontWeight: FontWeight.w500
        ),
        overline: TextStyle(
            color: Colors.grey.shade50,
            fontSize: 10,
            fontWeight: FontWeight.w400
        )
    ),
  );
}