import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:dartup_meet_with_angular/components/todo_list/todo_list_component.dart';
import 'package:dartup_meet_with_angular/services/lifecycle_log_service.dart';
import 'package:dartup_meet_with_angular/services/todo_list_service.dart';

@Component(
  selector: 'dartup-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    NgIf,
    NgFor,
    MaterialProgressComponent,
    TodoListComponent,
  ],
  providers: [
    ClassProvider(TodoListService),
    ClassProvider(LifecycleLogService),
  ],
)
class AppComponent with LifecycleLogService implements OnInit {
  final TodoListService todoListService;
  bool isLoaded = false;

  List<String> get items => todoListService.todoList;

  AppComponent(this.todoListService);

  @override
  void ngOnInit() {
    super.ngOnInit();
    todoListService.loadTodoList().then((result) => isLoaded = result);
  }

  @override
  String get className => 'AppComponent';
}
