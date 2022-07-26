import 'package:flutter/foundation.dart';
import 'package:todoey/models/tasks.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskList = [
    Task(
      taskName: "Code",
    ),
    Task(taskName: "Eat")
  ];

  int get taskCount {
    return taskList.length;
  }

}
