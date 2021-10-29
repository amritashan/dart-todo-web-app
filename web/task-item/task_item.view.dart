import 'dart:html';

import '../types/task.dart';

class TaskItemView {
  final Task _task;
  TaskItemView(this._task);

  render() {
    final id = _task.id;
    final title = _task.title;
    final isCompleted = _task.isCompleted;

    final taskItemDiv = DivElement()..className = 'task-item';

    if (isCompleted) {
      taskItemDiv.classes.add('completed');
    }

    final lhsDiv = DivElement()..classes.add('task-action-container');

    final radioButton = CheckboxInputElement()
      ..value = id.toString()
      ..checked = isCompleted
      ..onClick.listen((event) => _task.onStateSetAction(_task));

    final titleDiv = DivElement()
      ..text = title
      ..className = 'task-title';

    lhsDiv.children.addAll([radioButton, titleDiv]);

    final deleteButtonDiv = DivElement()
      ..text = 'delete'
      ..classes.add('delete-task')
      ..onClick.listen((event) => _task.onTaskDeleteAction(_task));

    taskItemDiv.children.addAll([lhsDiv, deleteButtonDiv]);

    return taskItemDiv;
  }
}
