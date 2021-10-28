import 'dart:html';

import 'task_list.view.dart';
import 'task.dart';

TaskListView taskListView = TaskListView();

late final InputElement newTaskInputElement;
late final ButtonElement addTaskButtonElement;
late final UListElement listArea;

void main() {
  newTaskInputElement = querySelector('#new-task') as InputElement;
  addTaskButtonElement = querySelector('#add-task') as ButtonElement;
  listArea = querySelector('#task-list') as UListElement;

  initializeList();
}

void initializeList() {
  addTaskButtonElement.onClick.listen((event) {
    final String title = newTaskInputElement.value!;

    if (title.trim() != '') {
      taskListView.addTask(title, onTaskAction);
      updateTaskList();
      clearInput();
    }
  });
}

void onTaskAction(Task task) {
  taskListView.setTaskState(task, !task.isCompleted);
  updateTaskList();
}

void updateTaskList() {
  while (listArea.firstChild != null) {
    listArea.lastChild?.remove();
  }

  final renderedItems = taskListView.renderTaskLists();

  listArea.children.addAll(renderedItems);
}

void clearInput() {
  newTaskInputElement.value = '';
}
