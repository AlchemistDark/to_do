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
      title: 'ToDoShka',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Таскоделалка'),
    );
  }  //Widget build(BuildContext context)
}  //class

class MyHomePage extends StatefulWidget {  // я нихрена не понимаю что я тут делаю >_<
                                           // но это какой-то флаттеровский костыль
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tasks = <Task>[];      //Это должен быть список всех объектов Task,
                         //который передаётся TaskWidget в ListView.
  
  _taskAd(text) {
    var _dT = DateTime.now();                      //генерирует уникальный ID
    int _taskID = _dT.microsecondsSinceEpoch;      //как количество микросекунд с начала Эпохи Unix
    print (_taskID.toString());
    tasks.add(Task(_taskID, text, false));}     //Добавляет таску

  _taskCBChange(bool isChecked) {
    //int _taskID = tasks[taskIndex].uid;
    bool sel = !isChecked;
    return sel;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.up,
        children: [
          TextField(                            //Итак проканало, TextFormFiled не пригодился.
            controller: TextEditingController(),//Эта хрень нужна что бы чисть поле
                                                //после каждого ввода.
            onSubmitted: (text) {
              setState(() {
                _taskAd(text);     //Добавляет текст в список тасок
                TextEditingController().text = " ";//Эта хрень чистит поле после каждого ввода.
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Введите таску",
            ),
          ),
          Flexible(
            child: ListView.builder( //Список тасок.
              padding: const EdgeInsets.all(8),
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return TaskWidget(
                  isChecked: tasks[index].isDone,
                  taskName: tasks[index].name,
                  callBack: (isChecked) {
                    setState(() {_taskCBChange(isChecked);});
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


