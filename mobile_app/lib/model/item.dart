class Item {
  final int? code;
  final String description;
  final int qtyOnHand;
  final double unitPrice;

  Item({
    this.code,
    required this.description,
    required this.qtyOnHand,
    required this.unitPrice,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      code: map['code'],
      description: map['description'],
      qtyOnHand: map['qty'],
      unitPrice: map['unitPrice'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'description': description,
      'qty': qtyOnHand,
      'unitPrice': unitPrice,
    };
  }

  @override
  String toString() {
    return 'Item{code: $code, description: $description, qty: $qtyOnHand, unitPrice: $unitPrice}';
  }
}
