import 'task.dart';

class TaskList {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return _tasks;
  }

  set tasks(List<Task> list) {
    if (list.isNotEmpty) {
      _tasks = list;
    }
  }

  addTask(Task task) {
    tasks.add(task);
  }

  removeTask(int id) {
    tasks.removeWhere((element) => element.id == id);
  }

  setState(int id, bool state) {
    final task = tasks.firstWhere((element) => element.id == id);
    task.isCompleted = state;
  }
}
