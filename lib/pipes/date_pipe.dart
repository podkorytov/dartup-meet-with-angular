import 'package:angular/angular.dart';
import 'package:intl/intl.dart';

@Pipe('itemDate')
class TodoDatePipe extends PipeTransform {
  final _formatter = new DateFormat.yMMMMd("en_US").add_jm();

  String transform(DateTime value) => _formatter.format(value);
}
