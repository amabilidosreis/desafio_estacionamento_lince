import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

Future<Database> getDatabases() async {
  final path = await getDatabasesPath();
  return openDatabase(
    '$path/meu_projeto.db',
    version: 1,
    onCreate: _create,
    onUpgrade: _onUpgrade,
  );
}