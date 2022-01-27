//import 'package:flutter/foundation.dart';
import 'package:to_do/entities/task.dart';

class TasksDataSource {
  Future<Task> create(String name, bool isDone) async {
    var dT = DateTime.now();                      // Генерирует уникальный ID
    int taskID = dT.microsecondsSinceEpoch;      // как количество микросекунд с начала Эпохи Unix.
    await Future.delayed(Duration(milliseconds: 100));
    final newTask = Task(taskID, name, isDone);
    _tasks.add(newTask);
    return newTask;
  }

  Future<void> delete(int uid) async {
    final indexToDelete = _tasks.indexWhere((iTask) => iTask.uid == uid);
    if (indexToDelete == -1) {
      print("Can't find element with id: $uid.");
      return;
    }
    await Future.delayed(Duration(milliseconds: 70));
    _tasks.removeAt(indexToDelete);
  }

  void rename(){

  }

  void update(){

  }

  Future<List<Task>> readAll() async{
    //await Future.delayed(Duration(milliseconds: 50));
    return _tasks.toList();
  }

  final _tasks = <Task>[];
}