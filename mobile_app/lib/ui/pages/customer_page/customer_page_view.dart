import 'package:flutter/material.dart';
import '../../../model/customer.dart';
import '../../../util/customer_crud_util.dart';
import '../../widgets/customer_card_widget.dart';
import '../../widgets/customer_form_widget.dart';


class CustomerPageView extends StatelessWidget {
  const CustomerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<List<Customer>> _customers =
        CustomerCrudUtil().getAllCustomers();
    return SingleChildScrollView(
      child: Container(
        color: Colors.deepPurple[50],
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.deepPurple,
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    const Text(
                      'Manage Customers',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const CustomerForm(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person_add,
                            color: Colors.deepPurple,
                          ),
                          SizedBox(width: 8),
                          Text('Add Customer'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 14, 20, 10),
              child: SearchBar(
                hintText: 'Search Customer',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.57,
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  physics: const BouncingScrollPhysics(),
                  child: FutureBuilder<List<Customer>>(
                    future: _customers,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return CustomerCard(
                              customer: snapshot.data![index],
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Failed to load customers'),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
