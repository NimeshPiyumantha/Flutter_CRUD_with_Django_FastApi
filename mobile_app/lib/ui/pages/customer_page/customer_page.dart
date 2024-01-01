import 'package:flutter/material.dart';
import 'package:mobile_app/ui/widget/customer_card.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isTextFieldVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24.0),
              CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
                
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPopupMenu,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showPopupMenu() async {
    final screenWidth = MediaQuery.of(context).size.width;

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width * 0.25,
        MediaQuery.of(context).size.height * 0.4,
        MediaQuery.of(context).size.width * 0.25,
        MediaQuery.of(context).size.height * 0.4,
      ),
      items: [
        PopupMenuItem(
          value: 1,
          child: SizedBox(
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isTextFieldVisible = false;
                    });
                    saveCustomer();
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ],
    ).then((value) {
      if (value == 1) {
        setState(() {
          isTextFieldVisible = !isTextFieldVisible;
        });
      }
    });
  }

  void saveCustomer() {
    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
