import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database.dart';
import '../model/car.dart';
import 'package:path_provider/path_provider.dart';

const _numberOfVacancies = 'number_of_vacancies';

/// Vacancies State
class VacanciesState extends ChangeNotifier {
  SharedPreferences? _sharedPreferences;
  int _vacanciesNumber;

  int get vacanciesNumber => _vacanciesNumber;

  final cars = <Car>[];
  final deletedCars = <Car>[];

  /// Reload the vacancies_number screen
  Future<void> reload(int vancanciesNumber) async {
    vancanciesNumber = _sharedPreferences?.getInt(_numberOfVacancies) ?? 0;
    notifyListeners();
  }

  /// Save the elements in the shared preferences
  Future<void> save(int vancanciesNumber) async {
    await _sharedPreferences?.setInt(_numberOfVacancies, vancanciesNumber);
  }

  ///
  VacanciesState(this._vacanciesNumber) {
    save(_vacanciesNumber);
    notifyListeners();
  }

  Future<void> _init() async {
    final value = await SharedPreferences.getInstance();

    _sharedPreferences = value;
    await save(vacanciesNumber);
    await reload(vacanciesNumber);
  }

  Future<void> addItem(Car car) async {
    final db = StayDatabase();
    cars.add(car);
    await db.insertCar(car);
    print(db.insertCar);

  }

  final ImagePicker _picker = ImagePicker();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  Future<void> imagePicker(String image) async{
    final image = await _picker.pickImage(source: ImageSource.camera);

    if(!valueValidator(image?.path)){
      final file = File(image!.path);
      final directore = await getApplicationDocumentsDirectory();
      final path = await file.copy('${directore.path}/$image');

      print('PATH >> ${path.path}');
    }
  }

}
