import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget{
  final bool isChecked;
  final String taskName;
  final callBack;

  TaskWidget({Key? key, required this.isChecked, required this.taskName, required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: callBack),
          Expanded(child: Text(taskName, style: TextStyle(fontSize: 22))),
          // FloatingActionButton
        ]);
  }
}