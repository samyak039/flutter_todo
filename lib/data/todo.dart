class Todo {
  bool isDone = false;
  String task;

  Todo({
    required this.task,
  });

  void toggleStatus() {
    if (isDone) {
      isDone = false;
    } else {
      isDone = true;
    }
  }
}
