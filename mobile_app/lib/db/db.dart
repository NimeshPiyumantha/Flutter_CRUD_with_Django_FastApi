import 'package:sqflite/sqflite.dart';

class DB {
  static int version = 1;
  static String dbName = 'mpos.db';

  static Future<Database> getDB() async {
    return await openDatabase(
      dbName,
      version: version,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS customer (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            address TEXT NOT NULL,
            phone TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS item (
            code INTEGER PRIMARY KEY AUTOINCREMENT,
            description TEXT NOT NULL,
            unitPrice DECIMAL NOT NULL,
            qtyOnHand INTEGER NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS orders (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            customerId INTEGER NOT NULL,
            itemCode INTEGER NOT NULL,
            orderDate DATETIME NOT NULL,
            cost DECIMAL NOT NULL,
            FOREIGN KEY (customerId) REFERENCES customer (id),
            FOREIGN KEY (itemCode) REFERENCES item (id)
          )
        ''');
      },
    );
  }
}
