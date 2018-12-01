import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:dartup_meet_with_angular/src/models/todo.dart';
import 'package:dartup_meet_with_angular/src/todo_item/todo_item_component.dart';

import 'todo_list_service.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
    TodoItem
  ],
  providers: [
    ClassProvider(TodoListService),
  ],
)
class TodoListComponent implements OnInit {
  final TodoListService todoListService;

  List<Todo> items = [];
  String newTodo = '';

  TodoListComponent(this.todoListService);

  @override
  Future<Null> ngOnInit() async {
    items = await todoListService.getTodoList();
  }

  void add() {
    items.add(new Todo(newTodo, DateTime.now()));
    newTodo = '';
  }

  void remove(int index) => items.removeAt(index);
}
