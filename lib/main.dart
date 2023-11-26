import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_hive_getx/screens/home_screen.dart';

void main() async {
  //initialize Hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox("MyBox");
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoHome(),
      theme: ThemeData(primarySwatch: Colors.cyan),
    );
  }
}
