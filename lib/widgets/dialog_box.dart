import 'package:flutter/material.dart';
import 'package:todo_app_hive_getx/widgets/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onSave;
  final Function()? onCancel;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.cyan,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  filled: true,
                  fillColor: Colors.cyan[200],
                  hintText: "Enter the Task",
                  hintStyle: TextStyle(color: Colors.cyan[800])),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                MyButton(title: "Save", onPressed: onSave),

                const SizedBox(
                  width: 8,
                ),

                //cancel
                MyButton(title: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
