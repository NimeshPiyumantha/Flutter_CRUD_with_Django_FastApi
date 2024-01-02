import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/pages/customer_page/customer_page_event.dart';
import 'package:mobile_app/ui/widget/customer_card.dart';

import 'customer_page_bloc.dart';

class CustomerPageView extends StatefulWidget {
  const CustomerPageView({Key? key}) : super(key: key);

  @override
  State<CustomerPageView> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPageView> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24.0),
              GestureDetector(
                onTap: _showPopupMenuUpdateDelete,
                child: const CustomerCard(
                  id: "1",
                  name: "name",
                  address: "address",
                  phone: "phone",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPopupMenuAdd,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showPopupMenuAdd() async {
    final screenWidth = MediaQuery.of(context).size.width;
    final customerHomePage = BlocProvider.of<CustomerPageBloc>(context);

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
                  onPressed: () async {
                    customerHomePage.add(
                      SaveCustomerEvent(
                        nameType: nameController.text,
                        addressType: addressController.text,
                        phoneType: phoneController.text,
                      ),
                    );
                    clearTextfield();
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showPopupMenuUpdateDelete() async {
    final customerHomePage = BlocProvider.of<CustomerPageBloc>(context);

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
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(labelText: 'ID'),
                ),
                const SizedBox(height: 16.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        customerHomePage.add(
                          UpdateCustomerEvent(
                            idType: int.parse(idController.text),
                            nameType: nameController.text,
                            addressType: addressController.text,
                            phoneType: phoneController.text,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('Update'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        customerHomePage.add(
                          DeleteCustomerEvent(
                            idType: int.parse(idController.text),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void clearTextfield() {
    // nameController.clear();
    // addressController.clear();
    // phoneController.clear();
  }
}
