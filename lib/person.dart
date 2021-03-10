import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Person{
  String id;
  String name;
  Person({required this.id, required this.name});
}
class PersonNotifier extends StateNotifier<List<Person>>{
  PersonNotifier() : super([]);

  addList(Person person){
    state=[...state,person];
  }

  @override
  set state(List<Person> value) {
    // TODO: implement state
    super.state = value;
  }
}
class IntNotifier extends ChangeNotifier{
  int index=0;

  incrementIndext(){
    index+=1;
    notifyListeners();
  }
}