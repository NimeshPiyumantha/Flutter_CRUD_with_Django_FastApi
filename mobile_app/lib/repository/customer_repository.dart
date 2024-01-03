import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../model/customer.dart';
import '../util/db_util.dart';

class CustomerRepository {
  Future<http.Response> getAllCustomer() async {
    final response = await http.get(
      Uri.parse('$baseUrl/customers'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<void> saveCustomer(Customer customer) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.92.142:8000/api/v1/customers'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(customer.toJson()),
      );

      if (response.statusCode != 201) {
        Logger().d('Successfully to create Customer: ${response.statusCode}');
      }
    } catch (error) {
      Logger().e('Error creating Customer: $error');
    }
  }

  Future<void> updateCustomer(Customer customer) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/customers'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(customer.toJson()),
      );

      if (response.statusCode != 201) {
        Logger().d('Successfully to update Customer: ${response.statusCode}');
      }
    } catch (error) {
      Logger().e('Error updating Customer: $error');
    }
  }

  Future<void> deleteCustomer(int customerId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/customers/$customerId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 201) {
        Logger().d('Successfully to delete Customer: ${response.statusCode}');
      }
    } catch (error) {
      Logger().e('Error deleting Customer: $error');
    }
  }
}
