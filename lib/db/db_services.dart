import 'package:mapbox/models/loaction.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  String locationTable = 'location_table';
  String locLatitude = 'lat';
  String locLongitude = 'long';

  DatabaseHelper._createInstance();
  static DatabaseHelper? _databaseHelper;

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }

  static Database? _database;
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    //String directoryPath=await getDatabasePath();
    String directoryPath = await getDatabasesPath();
    String dbLocation = directoryPath + 'location.db';

    var locationDatabase =
        await openDatabase(dbLocation, version: 1, onCreate: _createDbTable);
    return locationDatabase;
  }

  void _createDbTable(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $locationTable(AUTOINCREMENT,$locLatitude TEXT,$locLongitude TEXT)');
  }

  //Fetch operation get contact object from db
  Future<List<Map<String, dynamic>>> getLocationMapList() async {
    Database db = await this.database;
    List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT * FROM $locationTable');
    return result;
  }

  Future<int> insertLocation(TLocation location) async {
    Database db = await this.database;
    var result = await db.insert(locationTable, location.toMap());
    // print(await db.query(contactTable));
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Contact List' [ List<Contact> ]
  Future<List<TLocation>> getLocationList() async {
    var locationMapList =
        await getLocationMapList(); // Get 'Map List' from database
    int count =
        locationMapList.length; // Count the number of map entries in db table

    List<TLocation> locationList = <TLocation>[];
    // For loop to create a 'Contact List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      locationList.add(TLocation.fromMapObject(locationMapList[i]));
    }

    return locationList;
  }
}
