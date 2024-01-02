import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../model/customer.dart';
import '../util/db_util.dart';

class CustomerRepository {
  Future<http.Response> getAllStudents() async {
    final response = await http.get(
      Uri.parse('$baseUrl/customers'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<void> saveStudent(Customer customer) async {
    Logger().d('Customer: ${customer.toJson()}');
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/customers'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(customer.toJson()),
      );

      if (response.statusCode != 201) {
        Logger().d('Successfully to create Student: ${response.statusCode}');
      }
    } catch (error) {
      Logger().e('Error creating student: $error');
    }
  }

  Future<void> updateStudent(Customer customer) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/customers'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(customer.toJson()),
      );

      if (response.statusCode != 201) {
        Logger().d('Successfully to update Student: ${response.statusCode}');
      }
    } catch (error) {
      Logger().e('Error updating student: $error');
    }
  }

  Future<void> deleteStudent(String customerId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/customers/$customerId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 201) {
        Logger().d('Successfully to delete Student: ${response.statusCode}');
      }
    } catch (error) {
      Logger().e('Error deleting student: $error');
    }
  }
}
