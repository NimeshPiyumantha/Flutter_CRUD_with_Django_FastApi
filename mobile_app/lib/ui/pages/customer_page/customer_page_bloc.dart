import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  }

  FutureOr<void> _updateCustomer(
      UpdateCustomerEvent event, Emitter<CustomerPageState> emit) async {
    final customer = Customer(
      id: event.idType,
      name: event.nameType,
      address: event.addressType,
      phone: event.phoneType,
    );

    add(GetAllCustomerEvent());
  }

  FutureOr<void> _saveCustomer(
      SaveCustomerEvent event, Emitter<CustomerPageState> emit) async {
        print("save customer");
    final customer = Customer(
      id: 0,
      name: event.nameType,
      address: event.addressType,
      phone: event.phoneType,
    );
    print(customer);
    await CustomerRepository().saveStudent(customer);
    print("save customer1");
    add(GetAllCustomerEvent());
  }

  FutureOr<void> _getAllCustomer(
      GetAllCustomerEvent event, Emitter<CustomerPageState> emit) async {}
}
