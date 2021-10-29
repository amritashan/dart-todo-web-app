typedef TaskActionHandler = void Function(Task t);

class Task {
  late int id;
  late String title;
  late bool isCompleted;
  late TaskActionHandler onStateSetAction;
  late TaskActionHandler onTaskDeleteAction;

  Task(this.id, this.title, this.isCompleted, this.onStateSetAction,
      this.onTaskDeleteAction);
}
