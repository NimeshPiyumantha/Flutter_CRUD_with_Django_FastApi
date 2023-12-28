import 'package:flutter/material.dart';
import 'package:mobile_app/model/customer.dart';
import 'package:mobile_app/ui/widgets/customer_form_widget.dart';


class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key, required this.customer});
  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
              leading: const Icon(Icons.person),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(customer.name),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    customer.id.toString(),
                    style: const TextStyle(
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(customer.address),
                  Text(
                    customer.phone ?? 'No Contact',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const CustomerForm(),
                  );
                },
                child: const Text('Edit'),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {},
                child: const Text('Delete'),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
