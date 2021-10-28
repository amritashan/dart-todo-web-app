import 'dart:html';

import 'task_list.dart';
import 'task.dart';

class TaskListView {
  TaskList taskList = TaskList();

  LIElement _createNewLiElement(Task task) {
    final id = task.id;
    final title = task.title;
    final isCompleted = task.isCompleted;

    final liElement = LIElement()..className = isCompleted ? 'completed' : '';
    final radioButton = CheckboxInputElement()
      ..value = id.toString()
      ..checked = isCompleted
      ..onClick.listen((event) => task.onAction(task));

    final titleDiv = DivElement()
      ..text = title
      ..className = 'task-title';

    liElement.children.addAll([radioButton, titleDiv]);

    return liElement;
  }

  renderTaskLists() {
    return taskList.tasks.map(_createNewLiElement);
  }

  addTask(String title, TaskActionHandler handler) {
    final id = DateTime.now().millisecondsSinceEpoch;
    taskList.addTask(Task(id, title, false, handler));
  }

  setTaskState(Task task, bool state) {
    taskList.setState(task.id, state);
  }
}
