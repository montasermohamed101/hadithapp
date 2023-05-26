import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier{
  String currentLocale = "en";
  ThemeMode currentTheme = ThemeMode.light;
  bool switchValue = false;

  changeCurrentLocale(String newLocale)async{
    currentLocale = newLocale;
    notifyListeners();
    final  prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', newLocale);
  }

  changeCurrentTheme(ThemeMode newTheme)async{
    currentTheme = newTheme;
    notifyListeners();
    final  prefs = await SharedPreferences.getInstance();
    prefs.setString('theme',newTheme ==  ThemeMode.light ? 'light' : 'dark');

  }

}