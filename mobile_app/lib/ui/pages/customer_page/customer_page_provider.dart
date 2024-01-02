import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customer_page_bloc.dart';
import 'customer_page_view.dart';

class CustomerPageProvider extends StatelessWidget {
  const CustomerPageProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomerPageBloc>(
      create: (context) => CustomerPageBloc(context),
      child: const CustomerPageView(),
    );
  }
}
