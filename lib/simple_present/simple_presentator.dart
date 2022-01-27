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
  Future<List<String>> loadAll() async{
    return await _ds.update();
  }
  /// Создаёт запись.
  void create(String str){
    _ds.create(str);
  }
  /// Редактирует запись.
  void edit(String oldStr, String newStr){
    _ds.edit(oldStr, newStr);
  }
  /// Удаляет запись.
  void delete(String str){
    _ds.delete(str);
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