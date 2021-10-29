import 'dart:html';

import '../task-item/task_item.view.dart';
import '../types/task.dart';
import '../types/task_list.dart';

class TaskListView {
  TaskList taskList = TaskList();

  render() {
    return taskList.tasks.map(_createNewLiElement);
  }

  LIElement _createNewLiElement(Task task) {
    final liElement = LIElement();
    final taskItemElement = TaskItemView(task).render();

    liElement.children.addAll([taskItemElement]);

    return liElement;
  }

  addTask(String title, TaskActionHandler stateSetHandler,
      TaskActionHandler deleteTaskHandler) {
    final id = DateTime.now().millisecondsSinceEpoch;
    taskList
        .addTask(Task(id, title, false, stateSetHandler, deleteTaskHandler));
  }

  setTaskState(Task task, bool state) {
    taskList.setState(task.id, state);
  }

  removeTask(Task task) {
    taskList.removeTask(task.id);
  }
}
