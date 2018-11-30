import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:dartup_meet_with_angular/components/todo_list/todo_list_component.dart';
import 'package:dartup_meet_with_angular/models/todo_item.dart';
import 'package:dartup_meet_with_angular/models/todo_state.dart';
import 'package:dartup_meet_with_angular/services/lifecycle_log_service.dart';
import 'package:dartup_meet_with_angular/services/todo_list_service.dart';
import 'package:dartup_meet_with_angular/services/todo_reducers.dart';
import 'package:redux/redux.dart';

@Component(
  selector: 'dartup-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    NgIf,
    NgFor,
    MaterialProgressComponent,
    MaterialButtonComponent,
    TodoListComponent,
  ],
  providers: [
    ClassProvider(TodoListService),
    ClassProvider(LifecycleLogService),
  ],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class AppComponent with LifecycleLogService implements OnInit {
  final TodoListService todoListService;
  final ChangeDetectorRef _changeDetectorRef;

  Store<TodoState> _store;
  bool isLoaded = false;

  List<TodoItem> get items => todoListService.todoList;

  AppComponent(this.todoListService, this._changeDetectorRef) {
    _store = new Store<TodoState>(
      TodoReducers.reducers,
      initialState: new TodoState([], ''),
    );

    _store.onChange.listen((_) => _changeDetectorRef.markForCheck());
  }

  @override
  void ngOnInit() {
    super.ngOnInit();
    todoListService.loadTodoList().then((result) {
      isLoaded = result;
      _changeDetectorRef.markForCheck();
    });
  }

  @override
  String get className => 'AppComponent';
}
