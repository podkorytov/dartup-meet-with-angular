import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:dartup_meet_with_angular/services/lifecycle_log_service.dart';

@Component(
  selector: 'todo-item',
  styleUrls: ['todo_item_component.css'],
  templateUrl: 'todo_item_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
  ],
  providers: [
    ClassProvider(LifecycleLogService),
  ],
)
class TodoItemComponent with LifecycleLogService {
  @Input()
  String item;

  @Input()
  int index;

  final _deleteItemStream = new StreamController<int>();

  @Output()
  Stream<int> get delete => _deleteItemStream.stream;

  void remove(int index) => _deleteItemStream.add(index);

  @override
  String get className => 'TodoItemComponent';
}
