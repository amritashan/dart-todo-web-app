import 'dart:html';

import 'task-list/task_list.view.dart';
import 'types/task.dart';

TaskListView taskListView = TaskListView();

late final InputElement newTaskInputElement;
late final InputElement addTaskButtonElement;
late final UListElement listArea;
late final FormElement todoFormElement;

void main() {
  newTaskInputElement = querySelector('#new-task') as InputElement;
  listArea = querySelector('#task-list') as UListElement;
  todoFormElement = querySelector('#todo-form') as FormElement;

  initializeForm();
}

void initializeForm() {
  todoFormElement.onSubmit.listen(addTask);
}

void addTask(Event event) {
  event.preventDefault();
  event.stopPropagation();

  final String title = newTaskInputElement.value!;

  if (title.trim() != '') {
    taskListView.addTask(title, onTaskStateSet, onTaskDelete);
    updateTaskList();
    clearInput();
    newTaskInputElement.focus();
  }
}

void onTaskStateSet(Task task) {
  taskListView.setTaskState(task, !task.isCompleted);
  updateTaskList();
}

void onTaskDelete(Task task) {
  taskListView.removeTask(task);
  updateTaskList();
}

void updateTaskList() {
  while (listArea.firstChild != null) {
    listArea.lastChild?.remove();
  }

  final renderedItems = taskListView.render();

  listArea.children.addAll(renderedItems);
}

void clearInput() {
  newTaskInputElement.value = '';
}
