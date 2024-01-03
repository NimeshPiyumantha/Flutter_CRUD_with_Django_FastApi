import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:mobile_app/model/customer.dart';

import '../../../repository/customer_repository.dart';
import 'customer_page_event.dart';
import 'customer_page_state.dart';

class CustomerPageBloc extends Bloc<CustomerPageEvent, CustomerPageState> {
  CustomerPageBloc(BuildContext context) : super(CustomerPageState.initial()) {
    on<CustomerPageEvent>((event, emit) async => switch (event) {
          GetAllCustomerEvent() => _getAllCustomer(event, emit),
          SaveCustomerEvent() => _saveCustomer(event, emit),
          UpdateCustomerEvent() => _updateCustomer(event, emit),
          DeleteCustomerEvent() => _deleteCustomer(event, emit),
        });

    add(GetAllCustomerEvent());
  }

  FutureOr<void> _deleteCustomer(
      DeleteCustomerEvent event, Emitter<CustomerPageState> emit) async {
    print("delete customer");
    await CustomerRepository().deleteCustomer(event.idType);
  }

  FutureOr<void> _updateCustomer(
      UpdateCustomerEvent event, Emitter<CustomerPageState> emit) async {
    final customer = Customer(
      id: event.idType,
      name: event.nameType,
      address: event.addressType,
      phone: event.phoneType,
    );
    await CustomerRepository().updateCustomer(customer);
    add(GetAllCustomerEvent());
  }

  FutureOr<void> _saveCustomer(
      SaveCustomerEvent event, Emitter<CustomerPageState> emit) async {
    print("save customer");
    final customer = Customer(
      name: event.nameType,
      address: event.addressType,
      phone: event.phoneType,
    );
    print(customer);
    await CustomerRepository().saveCustomer(customer);
    print("save customer1");
    add(GetAllCustomerEvent());
  }

  FutureOr<void> _getAllCustomer(
      GetAllCustomerEvent event, Emitter<CustomerPageState> emit) async {
    try {
      final response = await CustomerRepository().getAllCustomer();

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData.containsKey('data')) {
          List<dynamic> customerDataList = responseData['data'];

          List<Customer> customerList = [
            ...customerDataList
                .map((customerData) => Customer.fromJson(customerData)),
          ];

          emit(
            state.clone(
              customers: customerList,
            ),
          );
        } else {
          Logger().e('Response does not contain "data" key');
        }
      } else {
        Logger().e('Failed to load students: ${response.statusCode}');
      }
    } catch (e) {
      Logger().e('Error fetching students: $e');
    }
  }
}
