import 'package:dartup_meet_with_angular/actions/add_item_action.dart';
import 'package:dartup_meet_with_angular/models/todo_item.dart';
import 'package:dartup_meet_with_angular/models/todo_state.dart';
import 'package:redux/redux.dart';

class TodoReducers {
  static Reducer<TodoState> get reducers => _itemsReducer;

  static Reducer<TodoState> _itemsReducer = combineReducers<TodoState>([
    new TypedReducer<TodoState, AddItemAction>(_onAddItemReducer),
  ]);

  static TodoState _onAddItemReducer(TodoState state, AddItemAction action) =>
      new TodoState(
        state.items..add(new TodoItem(action.title, new DateTime.now())),
        '',
      );
}
