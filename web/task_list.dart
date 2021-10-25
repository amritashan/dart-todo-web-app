class TaskList {
  List<String> _tasks = [];

  List<String> get task {
    return _tasks;
  }

  set task(List<String> list) {
    if (list.isNotEmpty) {
      _tasks = list;
    }
  }

  addTask(taskItem) {
    _tasks.add(taskItem);
  }

  removeTask(int taskIndex) {
    _tasks.removeAt(taskIndex);
  }
}
