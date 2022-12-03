import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _numberOfVacancies = 'number_of_vacancies';

/// Vacancies State
class VacanciesState extends ChangeNotifier {
  SharedPreferences? _sharedPreferences;

  /// Reload the vacancies_number screen
  void reload(int vancanciesNumber) {
    vancanciesNumber = _sharedPreferences?.getInt(_numberOfVacancies) ?? 0;
    notifyListeners();
  }

  /// Save the elements in the shared preferences
  void save(int vancanciesNumber) {
    unawaited(_sharedPreferences?.setInt(_numberOfVacancies, vancanciesNumber));
  }

  ///
  VacanciesState(int vancaciesNumber) {
    unawaited(SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
      save(vancaciesNumber);
      reload(vancaciesNumber);
    }));
  }
}
