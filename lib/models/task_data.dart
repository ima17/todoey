import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/tasks.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _taskList = [
    Task(
      taskName: "Code",
    ),
    Task(taskName: "Eat")
  ];

  int get taskCount {
    return _taskList.length;
  }

  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  void addTask(String taskTitle) {
    final task = Task(taskName: taskTitle);
    _taskList.add(task);
    notifyListeners();
  }
}
