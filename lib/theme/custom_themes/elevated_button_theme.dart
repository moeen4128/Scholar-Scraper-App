import 'package:flutter/material.dart';
class TElevatedTheme{
  TElevatedTheme._();
  static final ElevatedButtonThemeData lightElvatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(
        color: Colors.blue,
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.white
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
    )
  );
  static ElevatedButtonThemeData darkElvatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(
          color: Colors.blue,
        ),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
      )
  );

}