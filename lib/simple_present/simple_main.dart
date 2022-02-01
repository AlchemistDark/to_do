import 'package:to_do/simple_present/simple_presentator.dart';

Future<void> main() async {
  //var lst = <String>[];
  final Proxy proxy = Proxy();


  // Это работало, пока я не добавил stream в simple_presentator.
  SimplePresentator present = SimplePresentator(proxy);
  present.data.listen((event) {print(event);});
  present.create("спать");


  //Future<List<String>> list = present.loadAll();
  //list.then((lst) => print(lst[0]));
  //print();


}