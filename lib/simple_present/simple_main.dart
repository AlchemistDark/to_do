import 'package:to_do/simple_present/simple_presentator.dart';

Future<void> main() async {
  //var lst = <String>[];
  final Proxy proxy = Proxy();


  // Это работало, пока я не добавил stream в simple_presentator.
  SimplePresentator present = SimplePresentator(proxy);
  present.data.listen((event) {print(event);});
  present.create("спать"); // Проверяю как работает create.

  present.create("ещё спать");  // Добавляю ещё элементов, что бы было с чем работать.
  present.create("больше спать");

  present.edit("ещё спать", "снова спать"); // Проверяю переименовывание. Ожидаю правильное срабатывание.

  // Я ожидал, что try catch из Proxy продолжит программу после ошибки, но оно почеиу-то так не работает...
  //present.edit("ещё спать", "снова спать"); // Проверяю переименовывание. Ожидаю ошибку.

  present.delete("снова спать"); // Проверяю удаление. Ожидаю правильное срабатывание.
  present.delete("снова спать"); // Проверяю удаление. Ожидаю ошибку.
  // Ошибки нет. Он не нашёл элемент и не стал ничего делать. Думаю, это неплохо бы как-то пофиксить.

  present.create("pass"); // Просто, что бы я знал, какому месту main соотвествует вывод консоли.
  present.loadAll(); // Смотрю, что сделает loadAll.

  // Закрытие стрима выдаёт ошибку. Я думаю это потому, что стрим закрывается до того, как возвращаются вызванные Future.
  //present.discard(); // Закрываю stream.
  //present.loadAll(); // Смотрю как программа отреагирует на обращение к закрытому стриму.







  //Future<List<String>> list = present.loadAll();
  //list.then((lst) => print(lst[0]));
  //print();


}