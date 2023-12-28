import 'package:bloc/bloc.dart';
import 'customer_page_event.dart';
import 'customer_page_state.dart';


class CustomerPageBloc extends Bloc<CustomerPageEvent, CustomerPageState> {
  CustomerPageBloc() : super(CustomerPageState.initialState);
}
