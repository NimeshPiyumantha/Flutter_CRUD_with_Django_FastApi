sealed class CustomerPageEvent {
}

class GetAllCustomerEvent extends CustomerPageEvent {
  GetAllCustomerEvent();
}

class SaveCustomerEvent extends CustomerPageEvent {
  final String nameType;
  final String addressType;
  final String phoneType;

  SaveCustomerEvent({
    required this.nameType,
    required this.addressType,
    required this.phoneType,
  });
}

class UpdateCustomerEvent extends CustomerPageEvent {
  final int idType;
  final String nameType;
  final String addressType;
  final String phoneType;

  UpdateCustomerEvent({
    required this.idType,
    required this.nameType,
    required this.addressType,
    required this.phoneType,
  });
}

class DeleteCustomerEvent extends CustomerPageEvent {
  final int idType;

  DeleteCustomerEvent({
    required this.idType,
  });
}
