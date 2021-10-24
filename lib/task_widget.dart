import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget{
  final bool isChecked;
  final String taskName;
  final callBackChecked;
  final callBackTextChange;

  TaskWidget({Key? key, required this.isChecked, required this.taskName,
    required this.callBackChecked, required this.callBackTextChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: callBackChecked),
        Expanded(child: GestureDetector(
          child: Text(taskName, style: TextStyle(fontSize: 22)),
          onLongPress: callBackTextChange
        )),
      ]
    );
  }
}