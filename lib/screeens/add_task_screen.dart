import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/button_widget.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom),
      height: 250.0,
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 30.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              20.0,
            ),
            topRight: Radius.circular(
              20.0,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add Task",
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700),
              ),
              TextField(
                autofocus: true,
                cursorColor: Colors.lightBlueAccent,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                  ),
                ),
                onChanged: (value) {
                  newTaskTitle = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle!);
                  Navigator.pop(context);
                },
                child: const ButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
