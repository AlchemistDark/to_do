/// Класс представления данных.
class SimplePresentator{
  //allStrings = <String>[];
  final Proxy _px = Proxy(); // Здесь хранятся все записи, полученные из _px._list.
  /// Получает все записи.
  Future<List<String>> loadAll() async {
    return await _px.loadAll();
  }
  /// Создаёт запись.
  void create(String str){
    _px.create(str);
  }
  /// Редактирует запись.
  void edit(String oldStr, String newStr){
    _px.edit(oldStr, newStr);
  }
  /// Удаляет запись.
  void delete(String str){
    _px.delete(str);
  }
}

/// Хранит функции доступа к DataSource что бы не захламлять основной (SimplePresentator) класс.
class Proxy{
  final DataSource _ds = DataSource(); // Здесь хранятся все записи, полученные из _ds._list.

  /*try {
  result = await dataSource.readAll();
  return result;
  } catch (e, st) {
  print("$e, $st");
  return [];*/

  /// Получает все записи.
  Future<List<String>> loadAll() async{
    try {
      return await _ds.update();
    } catch (e, st) {
      print("$e, $st");
      return <String>[];
    }
  }
  /// Создаёт запись.
  void create(String str){
    try {
      _ds.create(str);
    } catch (e, st) {
      print("$e, $st");
    }
  }
  /// Редактирует запись.
  void edit(String oldStr, String newStr){
    try {
      _ds.edit(oldStr, newStr);
    } catch (e, st) {
      print("$e, $st");
    };
  }
  /// Удаляет запись.
  void delete(String str){
    try {
      _ds.delete(str);
    } catch (e, st) {
      print("$e, $st");
    };
  }
}

/// Хранит записи.
class DataSource{
  final _list = <String>[]; // Здесь хранятся все записи.
  /// Создаёт запись.
  Future<void> create(String str) async {
    await Future.delayed(Duration(milliseconds: 50));
    _list.add(str);
  }
  /// Редактирует запись.
  Future<void> edit(String oldStr, String newStr) async {
    await Future.delayed(Duration(milliseconds: 50));
    int _i = _list.indexOf(oldStr);
    _list[_i] = newStr;
  }
  /// Удаляет запись.
  Future<void> delete(String str) async {
    await Future.delayed(Duration(milliseconds: 50));
    _list.remove(str);
  }
  /// Выдаёт весь список записей.
  Future<List<String>> update() async {
    await Future.delayed(Duration(milliseconds: 50));
    return _list;
  }
}