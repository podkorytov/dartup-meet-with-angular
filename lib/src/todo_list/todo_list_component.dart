import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

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
  ],
)
class TodoListComponent {
  @Input()
  List<String> items = [];

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
}
