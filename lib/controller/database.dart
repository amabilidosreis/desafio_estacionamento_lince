import 'package:sqflite/sqflite.dart';
import '../model/car.dart';

class StayDatabase {

  final String _tableName = 'STAY';
  final String _id = 'ID';
  final String _driversName = 'DRIVER_NAME';
  final String _licensePlate = 'LICENSE_PLATE';
  final String _entryDate = 'ENTRY_DATE ';
  final String _exitDate = 'EXIT_DATE';
  final String _price = 'TOTAL_PRICE';

  Future<Database> getDatabases() async {
    final path = await getDatabasesPath();
    return openDatabase(
      '$path/meu_projeto.db',
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName('
              '$_id           INTEGER PRIMARY KEY AUTOINCREMENT,'
              '$_entryDate    TEXT,'
              '$_exitDate     TEXT,'
              '$_licensePlate TEXT,'
              '$_driversName  TEXT,'
              '$_price        INTEGER)',
        );
      },
    );
  }

  Future<void> insertCar(Car car) async {
    final db = await getDatabases();

    await db.insert(
      _tableName,
      car.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Car>> car() async {
    final db = await getDatabases();

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return Car(
        licensePlate: maps[i]['licensePlate'],
        driverName: maps[i]['driverName'],
        entryFormat: maps[i]['entryDate']
      );
    });
  }

  /// Update a car
  Future<void> updateCar(Car car) async {
    final db = await getDatabases();

    await db.update(
      _tableName,
      car.toMap(),
      where: 'id = ?',
      whereArgs: [car.licensePlate],
    );
  }

  /// Delete car from the table
  Future<void> deleteCar(int id) async {
    final db = await getDatabases();

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}




