import 'package:flutter_bloc/flutter_bloc.dart';

import 'manage_order_page_event.dart';
import 'manage_order_page_state.dart';


class ManageOrderPageBloc
    extends Bloc<ManageOrderPageEvent, ManageOrderPageState> {
  ManageOrderPageBloc() : super(ManageOrderPageState.initialState);
}
