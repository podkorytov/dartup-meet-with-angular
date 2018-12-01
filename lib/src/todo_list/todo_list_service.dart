import 'dart:async';

import 'package:angular/core.dart';
import 'package:dartup_meet_with_angular/src/models/todo.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  List<Todo> mockTodoList = <Todo>[];

  Future<List<Todo>> getTodoList() async => mockTodoList;
}
