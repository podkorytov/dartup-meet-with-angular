class Todo {
  final String title;
  final DateTime createAt;

  String get wide => '${title} ${createAt}';

  Todo(this.title, this.createAt);
}