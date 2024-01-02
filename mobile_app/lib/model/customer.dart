class Customer {
  final int? id;
  final String name;
  final String address;
  final String phone;

  Customer({
    this.id,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
    };
  }

  @override
  String toString() {
    return 'Customer{id: $id, name: $name, address: $address, phone: $phone}';
  }
}
