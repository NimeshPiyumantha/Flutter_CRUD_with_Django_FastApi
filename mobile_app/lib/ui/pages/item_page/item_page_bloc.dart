import 'package:bloc/bloc.dart';
import 'item_page_event.dart';
import 'item_page_state.dart';


class ItemPageBloc extends Bloc<ItemPageEvent, ItemPageState> {
  ItemPageBloc() : super(ItemPageState.initialState);
}
