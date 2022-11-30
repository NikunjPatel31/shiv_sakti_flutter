import 'package:path/path.dart';
import 'package:shiv_sakti/Model/Category.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "shiv_sakti.db";
  static final _databaseVersion = 1;

  static final TABLE_CATEGORY = "category";

  static final CATEGORY_ID = "category_id";
  static final CATEGORY_NAME = "category_name";

  DatabaseHelper._privateConstrutor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstrutor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $TABLE_CATEGORY (
            $CATEGORY_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $CATEGORY_NAME TEXT
          );
          ''');
  }

  Future<int?> insert(Category category) async {
    Database? db = await instance.database;
    return await db?.insert(TABLE_CATEGORY, category.toJson());
  }

  Future<List<Category>?> queryAllRows() async {
    Database? db = await instance.database;
    final result = await db?.query(TABLE_CATEGORY);
    return result?.map((json) => Category.fromJson(json)).toList();
  }
}
