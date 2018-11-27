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

  List<String> get logs => _log;

  String get className => 'default';

  @override
  void ngAfterContentChecked() => _addLogCall('ngAfterContentChecked');

  @override
  void ngAfterContentInit() => _addLogCall('ngAfterContentInit');

  @override
  void ngAfterViewChecked() => _addLogCall('ngAfterViewChecked');

  @override
  void ngAfterViewInit() => _addLogCall('ngAfterViewInit');

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) =>
      _addLogCall('ngOnChanges');

  @override
  void ngOnDestroy() => _addLogCall('ngOnDestroy');

  @override
  void ngOnInit() => _addLogCall('ngOnInit');

  void _addLogCall(String methodName) {
    _log.add('${className} :: ${methodName} called at ${DateTime.now()}');
  }
}
