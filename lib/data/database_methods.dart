import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  //variabole//data
  List toDoList = [];

  //reference the box we created in main
  final _myBox = Hive.box("MyBox");

  //run this function if this is first time ever opening the app
  void createInitialData() {
    toDoList = [
      ["Learn Hive", false],
      ["Learn Getx", false]
    ];
  }

  //to load data from db//selection
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update data in db
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
