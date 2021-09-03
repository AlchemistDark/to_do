import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

List<String> list = <String>["Tom", "Alice", "Bob", "Sam", "Kate"];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoShka',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
      print("$_counter");
      list.add("$_counter");
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Container (child: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(),
          ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(tasks[index], style: TextStyle(fontSize: 22));
            }
          ),
          FloatingActionButton.extended(
            onPressed: () {_incrementCounter(); },
            label: Text("Добавить таску")
          ),
        ]
      ),)
    );
  }
}

