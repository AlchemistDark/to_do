import 'package:to_do/simple_present/simple_presentator.dart';

void main(){
  //var lst = <String>[];
  SimplePresentator present = SimplePresentator();
  present.create("спать");
  Future<List<String>> list = present.loadAll();
  list.then((lst) => print(lst[0]));



}