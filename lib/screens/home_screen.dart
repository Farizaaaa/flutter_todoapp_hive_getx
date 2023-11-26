import 'package:flutter/material.dart';
import 'package:todo_app_hive_getx/widgets/to_do_list.dart';

class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  List toDoList = [
    ["Learn Hive", true],
    ["Learn Getx", false]
  ];

  //change checkbox
  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //create new task
  void createTask() {
    showDialog(context: context, builder: (context) => AlertDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: const Center(child: Text("TO DO")),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
                taskName: toDoList[index][0],
                taskStatus: toDoList[index][1],
                onChanged: (value) => checkBoxChange(value, index));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createTask,
        child: Icon(
          Icons.add,
          color: Colors.cyan[900],
        ),
      ),
    );
  }
}
