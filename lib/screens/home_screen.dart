import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_hive_getx/data/database_methods.dart';
import 'package:todo_app_hive_getx/widgets/dialog_box.dart';
import 'package:todo_app_hive_getx/widgets/to_do_list.dart';

class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  final _controller = TextEditingController();
  final _myBox = Hive.box("MyBox");
  ToDoDataBase db = ToDoDataBase();

// //task list
//   List toDoList = [
//     ["Learn Hive", true],
//     ["Learn Getx", false]
//   ];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    //if the first time evere opening this app call initaila data function in database
    if (_myBox.get("TODOLIST") == null) {
      //there is no data
      db.createInitialData();
    } else {
      //there already exists data
      db.loadData();
    }
  }

  //change checkbox
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //create new task
  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveTask,
          onCancel: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  //saving new task
  void saveTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      //the text we previously entered will be shown again there
      _controller.clear();
    });
    Navigator.pop(context);
    db.updateData();
  }

//delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
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
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
              taskName: db.toDoList[index][0],
              taskStatus: db.toDoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
              deleteTask: (context) => deleteTask(index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(
          Icons.add,
          color: Colors.cyan[900],
        ),
      ),
    );
  }
}
