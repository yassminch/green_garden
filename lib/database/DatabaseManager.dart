import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/Plant.dart';

class DatabaseManager {
  DatabaseManager._privateConstructor();

  static final DatabaseManager instance = DatabaseManager._privateConstructor();

  DatabaseManager();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'greengarden.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      //onUpgrade:_onupgrade,
      //onDowngrade:
    );
  }

  Future _onCreate(Database db, int version) async {
    print("Creatin database...........");
    await db.execute('''
      CREATE TABLE Plants(
      id INTEGER PRIMARY KEY ,
      name TEXT NOT NULL 
       );
      ''');



    print("fin creation database ! ...................................");
  }

  Future<int> addPlant(Plant plant) async {
    Database db = await instance.database;
    return await db.insert('Plants', plant.toMap());
  }

  Future<dynamic> getPlants() async {
    Database db = await instance.database;
    var listPlants = await db.rawQuery("Select * from Plants");
    return listPlants;
  }


  
}
