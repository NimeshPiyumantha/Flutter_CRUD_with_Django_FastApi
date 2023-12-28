import 'package:mobile_app/db/db.dart';
import 'package:mobile_app/model/customer.dart';

class CustomerCrudUtil {
  Future<List<Customer>> getAllCustomers() async {
    final db = await DB.getDB();
    final result = await db.query('customer');
    return result.map((e) => Customer.fromMap(e)).toList();
  }

  Future<String> createCustomer(Customer customer) async {
    try {
      final db = await DB.getDB();
      await db.insert('customer', customer.toMap());
      return 'Customer created successfully';
    } catch (e) {
      return 'Failed to create customer';
    }
  }

  Future<String> updateCustomer(Customer customer) async {
    try {
      final db = await DB.getDB();
      await db.update(
        'customer',
        customer.toMap(),
        where: 'id = ?',
        whereArgs: [customer.id],
      );
      return 'Customer updated successfully';
    } catch (e) {
      return 'Failed to update customer';
    }
  }

  Future<String> deleteCustomer(int id) async {
    try {
      final db = await DB.getDB();
      await db.delete(
        'customer',
        where: 'id = ?',
        whereArgs: [id],
      );
      return 'Customer deleted successfully';
    } catch (e) {
      return 'Failed to delete customer';
    }
  }
}
