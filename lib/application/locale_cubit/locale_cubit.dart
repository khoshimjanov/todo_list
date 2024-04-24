import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  static const String _key = 'languageValue';

  late SharedPreferences _prefs;

  LocaleCubit() : super(const Locale('en')) {
    _loadStoredString();
  }

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _loadStoredString() async {
    await initPrefs();

    final storedString = _prefs.getString(_key) ?? 'uz';
    emit(Locale(storedString));
  }

  void changeLanguage(String newValue) async {
    await _prefs.setString(_key, newValue);
    emit(Locale(newValue));
  }
}
