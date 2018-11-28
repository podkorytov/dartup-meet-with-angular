import 'dart:async';

import 'package:angular/core.dart';
import 'package:dartup_meet_with_angular/models/todo_item.dart';

@Injectable()
class TodoListService {
  static List<TodoItem> _mockTodoList = <TodoItem>[];

  Future<bool> loadTodoList() async =>
      new Future<bool>.delayed(const Duration(seconds: 3), () => true);

  List<TodoItem> get todoList => _mockTodoList;

  void add(String itemText) =>
      _mockTodoList.add(new TodoItem(itemText, DateTime.now()));

  TodoItem remove(int index) => _mockTodoList.removeAt(index);
}
