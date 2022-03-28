import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme;

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green.shade900)
        );
        break;

      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue.shade900)
        );
        break;

      case 3: //custom
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith( 
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueGrey)
      );
    } else {
      _currentTheme = ThemeData.light().copyWith( 
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red.shade300));
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow.shade300),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xff16202b),
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black87)),
      );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
