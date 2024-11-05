//Configure the application theme
import 'package:flutter/material.dart';

final themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.deepPurple[400], // Màu tím chính
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple[400], // Màu app bar
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: TextTheme(
    bodySmall: TextStyle(color: Colors.deepPurple[700]), // Văn bản chính
    bodyMedium: TextStyle(color: Colors.deepPurple[500]), // Văn bản phụ
    headlineLarge: TextStyle(
      color: Colors.deepPurple[700],
      fontWeight: FontWeight.bold,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepPurple[400], // FAB màu tím
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple[400],
      foregroundColor: Colors.white, // Màu nút tím
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.purple.shade400,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.purple[50], // Nền input field tím nhạt
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: const Color.fromARGB(255, 22, 169, 233), // Màu viền khi focus
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.deepPurple.shade400, // Màu viền bình thường
      ),
    ),
  ),
);
