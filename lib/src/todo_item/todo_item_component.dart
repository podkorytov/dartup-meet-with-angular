import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'todo-item',
  templateUrl: 'todo_item.html',
  directives: [
    MaterialFabComponent,
    MaterialIconComponent,
    MaterialCheckboxComponent
  ]
)
class TodoItem {
  @Input()
  String itemTitle;
  StreamController<Null> sc = new StreamController();

  void remove() {
    sc.add(null);
  }

  @Output()
  Stream<Null> get todo => sc.stream;

}