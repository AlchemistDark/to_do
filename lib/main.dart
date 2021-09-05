//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

List<String> list = <String>[];

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
  final List<String> tasks = list;
  
  String _taskText = " ";  //Хранит текст о добавляемой таске.
  _taskAd(text) {          //Добавляет этот текст.
      _taskText = text;
      list.add(_taskText);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
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
                TextEditingController().text = " ";//Эта хрень нужна что бы чисть поле
                                                   //после каждого ввода.
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
                return Text(tasks[index], style: TextStyle(fontSize: 22)); //Это я писал? О_О
                                                                           //Уже не помню зачем оно...
              }
            ),
          ),
        ]
      )
    );
  }
}

