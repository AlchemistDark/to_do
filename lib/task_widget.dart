import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget{
  final bool isEditable;
  final bool isChecked;
  final String taskName;
  final callBackChecked;
  final callBackTextChange;

  TaskWidget({Key? key, required this.isEditable, required this.isChecked, required this.taskName,
    required this.callBackChecked, required this.callBackTextChange}) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState(isEditable);

}

class _TaskWidgetState extends State<TaskWidget> {
  final bool isEditable;
  _TaskWidgetState(this.isEditable);
  //_TaskWidgetState._Editable(this.isEditable);
  //_TaskWidgetState._Uneditable(this.isEditable);
  @override
  Widget build(BuildContext context) {
    if (isEditable) {return _Editable(BuildContext context);}
    else {return _Uneditable(BuildContext context);}
  }
  Widget _Uneditable(BuildContext context) {
    return Row(
        children: [
          Checkbox(
              value: widget.isChecked,
              onChanged: widget.callBackChecked),
          Expanded(child: GestureDetector(
              child: Text(widget.taskName, style: TextStyle(fontSize: 22)),
              onLongPress: widget.callBackTextChange
          )),
        ]
    );
  }

  Widget _Editable (BuildContext context) {
    return TextField(
      controller: TextEditingController(),   // Эта хрень нужна что бы чисть поле
      // после каждого ввода.
      onSubmitted: (text) {
        setState(() {
          /*_taskAd(text);                     // Добавляет таск в tasks (строка 34)
          TextEditingController().text = " ";// Эта хрень чистит поле после каждого ввода.
        */});                                  // В конце setState обновляет виджет.
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Введите таску",
      ),
    );
  }


}

