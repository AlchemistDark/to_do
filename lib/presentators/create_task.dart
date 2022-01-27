import 'package:to_do/entities/task.dart';
import '../data_sources/task_ds.dart';

Future<List<Task>> createTask(TasksDataSource dataSource, String newName, bool isDone) async{
  try {
    await dataSource.create(newName, isDone);
    return dataSource.readAll();
  } catch (e, st) {
    print("$e, $st");
    return [];
  }
}