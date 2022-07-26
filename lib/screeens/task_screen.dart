import 'package:flutter/material.dart';
import 'package:todoey/models/tasks.dart';
import 'package:todoey/screeens/add_task_screen.dart';
import 'package:todoey/widgets/task_list.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> taskList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return AddTaskScreen(
                  addTaskCallback: (newTaskTitle) {
                    if (newTaskTitle != null) {
                      setState(() {
                        taskList.add(Task(taskName: newTaskTitle));
                      });
                    }
                    Navigator.pop(context);
                  },
                );
              });
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, bottom: 30.0, right: 30.0, left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Todoey",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  taskList.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: TaskList(
                tasks: taskList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
