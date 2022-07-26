import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            isChecked: taskData.taskList[index].isDone,
            taskTitle: taskData.taskList[index].taskName,
            checkboxCallback: (bool? checkboxState) {
              // setState(() {
              //   widget.tasks[index].toggleDone();
              // });
            },
          );
        },
        itemCount: taskData.taskCount,
      ),
    );
  }
}
