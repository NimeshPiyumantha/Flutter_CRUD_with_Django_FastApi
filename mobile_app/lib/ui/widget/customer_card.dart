import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final String id;
  final String name;
  final String address;
  final String phone;

  const CustomerCard({
    super.key,
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Id: $id'), // Hardcoded ID for demonstration
            Text('Name: $name'),
            Text('Address: $address'),
            Text('Phone: $phone'),
          ],
        ),
      ),
    );
  }
}
