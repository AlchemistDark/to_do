import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget{
  final bool selected;
  final String taskName;

  TaskWidget({Key? key, required this.selected, required this.taskName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Checkbox(onChanged: (b) {}, value: selected),
          Expanded(child: Text(taskName, style: TextStyle(fontSize: 22))),
          // FloatingActionButton
        ]);
  }
}