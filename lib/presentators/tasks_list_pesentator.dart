import 'dart:async';
import 'package:meta/meta.dart';
import 'package:to_do/presentators/create_task.dart';
import 'package:to_do/data_sources/task_ds.dart';
import 'package:to_do/entities/task.dart';
import 'package:to_do/presentators/delete_task.dart';
import 'package:to_do/presentators/load_tasks.dart';
import 'package:to_do/presentators/rename_task.dart';
import 'package:to_do/presentators/toggle_done_task.dart';

class TasksListPresentator{
  final TasksDataSource _dataSource;
  Stream<TasksListViewModel> get data => _ctrl.stream;
  StreamController<TasksListViewModel> _ctrl = StreamController<TasksListViewModel>.broadcast();
  TasksListViewModel lastEvent = TasksListViewModel([]);
  TasksListPresentator(this._dataSource){
    _loadAll();
  }
  void _loadAll() async{
    final List<Task> updatedTasks = await loadTasks(_dataSource);
    final viewModels = updatedTasks.map((task) => TaskViewModel(task.uid, task.name, task.isDone));
    final newEvent = TasksListViewModel(viewModels.toList());
    lastEvent = newEvent;
    _ctrl.add(newEvent);
  }
  void delete(int uid) async{
    final List<Task> updatedTasks = await deleteTask(uid);
    final viewModels = updatedTasks.map((task) => TaskViewModel(task.uid, task.name, task.isDone));
    final newEvent = TasksListViewModel(viewModels.toList());
    lastEvent = newEvent;
    _ctrl.add(newEvent);
  }
  void rename(int uid, String newName) async{
    final List<Task> updatedTasks = await renameTask(uid, newName);
    final viewModels = updatedTasks.map((task) => TaskViewModel(task.uid, task.name, task.isDone)).toList();
    final newEvent = TasksListViewModel(viewModels);
    lastEvent = newEvent;
    _ctrl.add(newEvent);
  }
  void toggleDone(int uid) async{
    final List<Task> updatedTasks = await toggleDoneTask(uid);
    final viewModels = updatedTasks.map((task) => TaskViewModel(task.uid, task.name, task.isDone)).toList();
    final newEvent = TasksListViewModel(viewModels);
    lastEvent = newEvent;
    _ctrl.add(newEvent);
  }
  void discard(){
    _ctrl.close();
  }

  void create(String name, bool isDone) async{
    final List<Task> updateTasks = await createTask(_dataSource, name, isDone);
    final viewModels = updateTasks.map((task) => TaskViewModel(task.uid, task.name, task.isDone)).toList();
    final newEvent = TasksListViewModel(viewModels);
    lastEvent = newEvent;
    _ctrl.add(newEvent);

  }
}


@immutable
class TasksListViewModel{
  final List<TaskViewModel> tasks;
  TasksListViewModel(this.tasks);
}

@immutable
class TaskViewModel{
  final int uid;
  final String taskName;
  final bool isDone;

  TaskViewModel(this.uid, this.taskName, this.isDone);

}