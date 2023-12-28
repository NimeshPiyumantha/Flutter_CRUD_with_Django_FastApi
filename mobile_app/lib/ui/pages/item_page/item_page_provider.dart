import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'item_page_bloc.dart';
import 'item_page_view.dart';


class ItemPageProvider extends BlocProvider<ItemPageBloc> {
  ItemPageProvider({
    Key? key,
  }) : super(
          key: key,
          create: (context) => ItemPageBloc(),
          child: const ItemPageView(),
        );
}
