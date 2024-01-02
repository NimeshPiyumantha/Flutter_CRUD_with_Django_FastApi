import 'package:mobile_app/model/customer.dart';

class CustomerPageState {
  final int? idType;
  final String nameType;
  final String addressType;
  final String phoneType;
  final bool isLoading;
  final List<Customer> customers;

  CustomerPageState({
    this.idType,
    required this.nameType,
    required this.addressType,
    required this.phoneType,
    required this.isLoading,
    required this.customers,
  });

  static CustomerPageState initial() => CustomerPageState(
      idType: null,
      nameType: '',
      addressType: '',
      phoneType: '',
      isLoading: false,
      customers: []);

  CustomerPageState clone({
    int? idType,
    String? nameType,
    String? addressType,
    String? phoneType,
    bool? isLoading,
    required List<Customer> customers,
  }) {
    return CustomerPageState(
      idType: idType ?? this.idType,
      nameType: nameType ?? this.nameType,
      addressType: addressType ?? this.addressType,
      phoneType: phoneType ?? this.phoneType,
      isLoading: isLoading ?? this.isLoading,
      customers: customers,
    );
  }
}
