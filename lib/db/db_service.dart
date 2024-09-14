import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../entity/food_bean.dart';

class DatabaseService extends GetxService {
  late Database db;
  final faker = Faker();

  Future<DatabaseService> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'plan_db.db');

    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await createTable(db);
    });
  }

  createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS foodRecord (id INTEGER PRIMARY KEY,name TEXT,images TEXT,steps TEXT,created_at TEXT)');
    await createDefaultData(db);
  }

  final DateFormat formatterDay = DateFormat('MM/dd/yyyy');

  createDefaultData(Database db) async {
    List<String> images = [
      "assets/images/image5.jpeg",
      "assets/images/image3.jpg",
      "assets/images/image1.jpg",
    ];
    List<String> steps = [
      " Sauteed chopped onions and garlic, added beef until browned.#"
          " Mixed in chopped tomatoes and sauce, simmered low. #"
          "Cooked pasta with salt and oil to prevent sticking. #"
          " Tossed pasta in meat sauce, topped with basil and Parmesan.",
      "Chose steak, let it rest at room temperature, seasoned with salt and pepper.#"
          " Heated a pan over high heat, added oil, seared the steak 2-3 minutes per side.#"
          " Reduced heat to medium-low, cooked to preference. #"
          "Rested for a few minutes before slicing, served with vegetables!",
      "Prepared dough, spread pizza sauce.#"
          " Topped with cheese, Italian sausage, mushrooms, and bell peppers.#"
          " Preheated oven to highest temp, baked pizza for 10-15 mins until crust was golden and cheese melted.#"
          " Removed, sliced, and served hot."
    ];
    for (var i = 0; i < images.length; i++) {
      var interval = faker.randomGenerator.integer(15, min: 3);
      var cuDate = DateTime.now();
      DateTime randomDate =
          faker.date.dateTimeBetween(cuDate.subtract(Duration(days: interval)), cuDate);
      var count = await db.insert('foodRecord', {
        'name': "Cuisine",
        'images': images[i],
        'steps': steps[i],
        'created_at': formatterDay.format(randomDate),
      });
    }
  }

  addRecord(String name, String images, String steps, String createAt) async {
    var count = await db.insert('foodRecord', {
      'name': name,
      'images': images,
      'steps': steps,
      'created_at': createAt,
    });
  }

  clean() async {
    await db.delete('foodRecord');
  }

  closer() async {
    await db.close();
  }

  Future<List<FoodBean>> getAll() async {
    var result = await db.query(
      'foodRecord',
      orderBy: 'created_at DESC',
    );
    return result.map((e) => FoodBean.fromJson(e)).toList();
  }
}
