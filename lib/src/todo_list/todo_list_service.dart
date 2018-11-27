import 'dart:async';

import 'package:angular/core.dart';

@Injectable()
class TodoListService {
  static List<String> _mockTodoList = <String>[];

  Future<bool> loadTodoList() async =>
      new Future<bool>.delayed(const Duration(seconds: 3), () => true);

  List<String> get todoList => _mockTodoList;

  void add(String itemText) => _mockTodoList.add(itemText);

  String remove(int index) => _mockTodoList.removeAt(index);
}
