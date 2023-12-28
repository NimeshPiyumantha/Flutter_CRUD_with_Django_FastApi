import 'package:mobile_app/db/db.dart';
import 'package:mobile_app/model/item.dart';

class ItemCrudUtil {
  Future<List<Item>> getAllItems() async {
    final db = await DB.getDB();
    final result = await db.query('item');
    return result.map((e) => Item.fromMap(e)).toList();
  }

  Future<String> createItem(Item item) async {
    try {
      final db = await DB.getDB();
      await db.insert('item', item.toMap());
      return 'Item created successfully';
    } catch (e) {
      return 'Failed to create item';
    }
  }

  Future<String> updateItem(Item item) async {
    try {
      final db = await DB.getDB();
      await db.update(
        'item',
        item.toMap(),
        where: 'code = ?',
        whereArgs: [item.code],
      );
      return 'Item updated successfully';
    } catch (e) {
      return 'Failed to update item';
    }
  }

  Future<String> deleteItem(String code) async {
    try {
      final db = await DB.getDB();
      await db.delete(
        'item',
        where: 'code = ?',
        whereArgs: [code],
      );
      return 'Item deleted successfully';
    } catch (e) {
      return 'Failed to delete item';
    }
  }
}
