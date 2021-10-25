import 'dart:html';
import 'task_list.dart';

LIElement createNewLiElement(String itemText) => LIElement()..text = itemText;
TaskList taskList = TaskList();

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
    final String task = newTaskInputElement.value!;

    if (task.trim() != '') {
      taskList.addTask(task);
      updateTaskList();
      clearInput();
    }
  });
}

void updateTaskList() {
  while (listArea.firstChild != null) {
    listArea.lastChild?.remove();
  }

  listArea.children.addAll(taskList.task.map(createNewLiElement));
}

void clearInput() {
  newTaskInputElement.value = '';
}
