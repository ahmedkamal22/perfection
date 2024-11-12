import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData? lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
);

void changeStatusBarIconColors() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
}
