import 'package:flutter/material.dart';
import '../util_barrel.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: darkPrimaryColor,
            primary: darkPrimaryColor,
            onPrimary: white,
            secondary: lightPrimaryColor,
            onSecondary: white,
            tertiary: black,
            onTertiary: white,
            background: appBackgroundColor,
            onBackground: white,
            error: Colors.red,
            onError: white,
            outline: primaryColor),
        hintColor: Colors.grey,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: darkPrimaryColor,
          iconTheme: IconThemeData(color: white),
          titleTextStyle: TextStyle(
              color: white,
              fontSize: 24.0,
              fontFamily: "DM Sans",
              fontWeight: FontWeight.w700),
        ),
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //   backgroundColor: lightPrimaryColor,
        //   foregroundColor: white,
        // ),
        cardTheme: CardTheme(
            margin: EdgeInsets.zero,
            color: white,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: white,
            showSelectedLabels: false,
              unselectedItemColor: inactiveGreyColor,
          selectedItemColor: lightPrimaryColor,
            ),
        snackBarTheme: const SnackBarThemeData(
            backgroundColor: darkPrimaryColor,
            contentTextStyle: TextStyle(
                color: white,
                fontSize: 14.0,
                fontFamily: "DM Sans",
                fontWeight: FontWeight.w700)));
  }
}
