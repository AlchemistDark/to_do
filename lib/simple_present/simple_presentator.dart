import 'dart:async';

/// Класс представления данных.
class SimplePresentator{
  final Proxy _px; // Здесь хранятся все записи, полученные из _px._list.
  Stream<List<String>> get data => _ctrl.stream; // Создаём stream.
  StreamController<List<String>> _ctrl = StreamController<List<String>>.broadcast(); // Создаём контроллер этого stream.
  List<String> lastEvent = []; // Я не помню что это и зачем, или не понимаю, но зачем-то тут пустой список...
  // Наверное это инициализация списка последних событий.

  /// Конструктор класса.
  SimplePresentator(this._px){
    _px.loadAll();
  }

  /// Получает все записи.
  void loadAll() async {
    final List<String> updatedList =  await _px.loadAll();
    final newEvent = updatedList.toList();
    lastEvent = newEvent;
    _ctrl.add(newEvent);
  }
  /// Создаёт запись.
  Future<void> create(String str) async {
    final List<String> updatedList = await _px.create(str);
    final newEvent = updatedList.toList();
    lastEvent = newEvent;
    _ctrl.add(newEvent);
  }
  /// Редактирует запись.
  void edit(String oldStr, String newStr) async {
    final List<String> updatedList = await _px.edit(oldStr, newStr);
    final newEvent = updatedList.toList();
    lastEvent = newEvent;
    _ctrl.add(newEvent);
  }
  /// Удаляет запись.
  void delete(String str) async {
    final List<String> updatedList = await _px.delete(str);
    final newEvent = updatedList.toList();
    lastEvent = newEvent;
    _ctrl.add(newEvent);
  }

  /// Закрыть stream.
  void discard(){
    _ctrl.close();
  }
}

/// Хранит функции доступа к DataSource что бы не захламлять основной (SimplePresentator) класс.
class Proxy{
  final DataSource _ds = DataSource(); // Здесь хранятся все записи, полученные из _ds._list.

  /// Получает все записи.
  Future<List<String>> loadAll() async{
    try {
      return await _ds.readAll();
    } catch (e, st) {
      print("$e, $st");
      return <String>[];
    }
  }
  /// Создаёт запись.
  Future<List<String>> create(String str) async {
    try {
      _ds.create(str);
      return await _ds.readAll();
    } catch (e, st) {
      print("$e, $st");
      return  <String>[];
    }
  }
  /// Редактирует запись.
  Future<List<String>> edit(String oldStr, String newStr) async {
    try {
      _ds.edit(oldStr, newStr);
      return await _ds.readAll();
    } catch (e, st) {
      print("$e, $st");
      return <String>[];
    }
  }
  /// Удаляет запись.
  Future<List<String>> delete(String str) async {
    try {
      _ds.delete(str);
      return await _ds.readAll();
    } catch (e, st) {
      print("$e, $st");
      return <String>[];
    }
  }
}

/// Хранит записи.
class DataSource{
  final _list = <String>[]; // Здесь хранятся все записи.
  /// Создаёт запись.
  Future<void> create(String str) async {
    await Future.delayed(Duration(milliseconds: 50));
    _list.add(str);
    //return _list;
  }
  /// Редактирует запись.
  Future<List<String>> edit(String oldStr, String newStr) async {
    await Future.delayed(Duration(milliseconds: 50));
    int _i = _list.indexOf(oldStr);
    _list[_i] = newStr;
    return _list;
  }
  /// Удаляет запись.
  Future<List<String>> delete(String str) async {
    await Future.delayed(Duration(milliseconds: 50));
    _list.remove(str);
    return _list;
  }
  /// Выдаёт весь список записей.
  Future<List<String>> readAll() async {
    await Future.delayed(Duration(milliseconds: 50));
    return _list;
  }
}