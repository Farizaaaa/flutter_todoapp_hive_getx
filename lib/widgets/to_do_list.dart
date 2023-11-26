import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  ToDoList(
      {super.key,
      required this.taskName,
      required this.taskStatus,
      required this.onChanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
      child: Slidable(
        //slidable from right
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.cyan[200], borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                  activeColor: Colors.cyan[800],
                  value: taskStatus,
                  onChanged: onChanged),

              //task name
              Text(taskName,
                  style: TextStyle(
                      decoration: taskStatus
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
            ],
          ),
        ),
      ),
    );
  }
}
