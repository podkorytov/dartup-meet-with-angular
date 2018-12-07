import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:dartup_meet_with_angular/components/todo_item/todo_item_component.dart';
import 'package:dartup_meet_with_angular/models/todo_item.dart';
import 'package:dartup_meet_with_angular/services/lifecycle_log_service.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
    TodoItemComponent,
  ],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class TodoListComponent with LifecycleLogService {
  @Input()
  List<TodoItem> items = [];

  final _newItemStream = new StreamController<String>();
  final _deleteItemStream = new StreamController<int>();

  @Output()
  Stream<String> get create => _newItemStream.stream;

  @Output()
  Stream<int> get delete => _deleteItemStream.stream;

  String newTodo = '';

  void add() {
    _newItemStream.add(newTodo);
    newTodo = '';
  }

  void remove(int index) => _deleteItemStream.add(index);

  @override
  String get className => 'TodoListComponent';
}
