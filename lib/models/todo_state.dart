import 'package:dartup_meet_with_angular/models/todo_item.dart';

class TodoState {
  final List<TodoItem> items;
  final String itemTitle;

  TodoState(this.items, this.itemTitle);
}
