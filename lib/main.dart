//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'entities/task.dart';
import 'task_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoShka',           // Заголовок окна с программой.
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,  // Цвет элементов окна.
      ),
      home: MyHomePage(title: 'Таскоделалка'),
    );
  }  //Widget build(BuildContext context)
}  //class

class MyHomePage extends StatefulWidget {  // Я нихрена не понимаю что я тут делаю >_<
                                           // но это какой-то флаттеровский костыль.
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tasks = <Task>[];      //Это должен быть список всех объектов Task,
                               //который передаётся TaskWidget в ListView.

  /// Добавляет таск в [tasks] (строка 31).
  void _taskAd(text) {
    var _dT = DateTime.now();                      // Генерирует уникальный ID
    int _taskID = _dT.microsecondsSinceEpoch;      // как количество микросекунд с начала Эпохи Unix.
    tasks.add(Task(_taskID, text, false));
  }

  /// Заменяет таск в [tasks] на копию с другим [isChecked].
  void _taskCBChange(bool isChecked, int index) {
    final Task _checkedTask = Task(tasks[index].uid, tasks[index].name, isChecked);
    final _checkedTasks = <Task>[_checkedTask];
    tasks.replaceRange(index, index + 1, _checkedTasks);
  }

  /// Заменяет таск в [tasks] на копию с другим [taskName].
  void _taskNameChange(String taskName, int index) {
    final Task _checkedTask = Task(tasks[index].uid, taskName, tasks[index].isDone);
    final _checkedTasks = <Task>[_checkedTask];
    tasks.replaceRange(index, index + 1, _checkedTasks);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.up,
        children: [
          TextField(
            controller: TextEditingController(),   // Эта хрень нужна что бы чисть поле
                                                   // после каждого ввода.
            onSubmitted: (text) {
              setState(() {
                _taskAd(text);                     // Добавляет таск в tasks (строка 34)
                TextEditingController().text = " ";// Эта хрень чистит поле после каждого ввода.
              });                                  // В конце setState обновляет виджет.
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Введите таску",
            ),
          ),
          Flexible(
            child: ListView.builder( //Список тасков.
              padding: const EdgeInsets.all(8),
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return TaskWidget(
                  isChecked: tasks[index].isDone,
                  taskName: tasks[index].name,
                  callBackChecked: (bool? isChecked) {
                    setState(() {_taskCBChange(isChecked!, index); });  // Заменяет таск в [tasks] на копию с другим isChecked (Строка 41)
                                                                        // затем обновляет виджет.
                  },
                  callBackTextChange: (String? taskName) {
                    setState(() {_taskNameChange(taskName!, index);});   // Заменяет таск в [tasks] на копию с другим isChecked (Строка 41)
                                                                        // затем обновляет виджет.
                  }
                );
              }
            ),
          ),
        ]
      )
    );
  }
}


