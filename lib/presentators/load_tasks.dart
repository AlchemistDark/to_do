import 'package:to_do/data_sources/task_ds.dart';
import 'package:to_do/entities/task.dart';

Future<List<Task>> loadTasks(TasksDataSource dataSource) async {
  late final List<Task> result;
  try {
    result = await dataSource.readAll();
    return result;
  } catch (e, st) {
    print("$e, $st");
    return [];
  }
}