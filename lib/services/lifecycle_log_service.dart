import 'package:angular/angular.dart';

@Injectable()
class LifecycleLogService
    implements
        OnInit,
        OnChanges,
        AfterContentInit,
        AfterContentChecked,
        AfterViewInit,
        AfterViewChecked,
        OnDestroy {
  static List<String> _log = <String>[];
  static int counter = 0;

  List<String> get logs => _log;

  String get className => 'default';

  @override
  // Initialize the directive/component after
  // Angular first displays the data-bound properties
  // and sets the directive/component’s input properties.
  void ngOnInit() => _addLogCall('ngOnInit');

  @override
  // Respond after Angular projects external content into the component’s view.
  void ngAfterContentInit() => _addLogCall('ngAfterContentInit');

  @override
  // Respond after Angular checks the content projected into the component.
  void ngAfterContentChecked() => _addLogCall('ngAfterContentChecked');

  @override
  // Respond after Angular initializes the component’s views and child views.
  void ngAfterViewInit() => _addLogCall('ngAfterViewInit');

  @override
  // Respond after Angular checks the component’s views and child views.
  void ngAfterViewChecked() => _addLogCall('ngAfterViewChecked');

  @override
  // Respond when Angular (re)sets data-bound input properties.
  // The method receives a SimpleChanges object
  // of current and previous property values.
  void ngOnChanges(Map<String, SimpleChange> changes) {
    _addLogCall('ngOnChanges');
    _log.add('Properties: ${changes.keys.join(',')}');
  }

  @override
  // Cleanup just before Angular destroys the directive/component.
  // Unsubscribe observables and detach event handlers to avoid memory leaks.
  void ngOnDestroy() => _addLogCall('ngOnDestroy');

  void _addLogCall(String methodName) {
    _log.add('${counter++}) ${className} :: ${methodName} called at ${DateTime.now()}');
  }
}
