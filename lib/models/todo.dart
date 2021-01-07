class Todo {
  String text;
  bool completed;

  Todo({this.text, this.completed = false});

  void toggleCompleted() => completed = !completed;
}