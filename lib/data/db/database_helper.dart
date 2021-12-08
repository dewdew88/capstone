import 'package:capstone/data/models/registration_history.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static DbHelper? _databaseHelper;
  static late Database _db;

  DbHelper._internal() {
    _databaseHelper = this;
  }

  factory DbHelper() => _databaseHelper ?? DbHelper._internal();

  static const String _tableName = 'history';

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'history_db.db'),
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE $_tableName (
              nama TEXT,
              ktp NUM,
              tempatLahir TEXT,
              tanggalLahir TEXT,
              nomorTelepon NUM,
              namaKlinik TEXT,
              tanggalVaksinasi TEXT
            )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<Database> get database async {
    _db = await _initializeDb();
    return _db;
  }

  Future<void> insertHistory(History history) async {
    final Database dataBase = await database;
    await dataBase.insert(_tableName, history.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('insert history');
  }

  Future<List<History>> getHistory() async {
    final Database dataBase = await database;
    List<Map<String, dynamic>> histories = await dataBase.query(_tableName);
    return histories.map((e) => History.fromMap(e)).toList();
  }
}