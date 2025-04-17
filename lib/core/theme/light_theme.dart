import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get theme {
    return ThemeData.light(
      useMaterial3: true
    ).copyWith(
      primaryColor: Colors.blue,
      // scaffoldBackgroundColor: Colors.grey[150],
      // scaffoldBackgroundColor:Color.fromARGB(255, 233, 244, 248), 
      scaffoldBackgroundColor: Color(0xFFE8ECEF),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
        bodySmall: TextStyle(color: Colors.black54, fontSize: 12),
        
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
        

        
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: const TextStyle(color: Colors.white),
          menuStyle: MenuStyle(
            backgroundColor: WidgetStateProperty.all(Colors.black),
            elevation: WidgetStateProperty.all(8),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )),
  
    
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}