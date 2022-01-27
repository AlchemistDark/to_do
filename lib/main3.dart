import 'package:to_do/data_sources/task_ds.dart';
import 'package:to_do/presentators/tasks_list_pesentator.dart';

void main(){
  TasksDataSource dataSource = TasksDataSource();
  TasksListPresentator presentator = TasksListPresentator(dataSource);
  presentator.data.listen(_onData);
  _showView(presentator.lastEvent);
  presentator.create("Name", false);
}
void _onData(TasksListViewModel event) {
  _showView(event);

}

void _showView(TasksListViewModel event) {
  print(event.tasks.length);
}
