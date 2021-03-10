import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter{
  int value;
  Counter({this.value=0});
}
class CounterNotifier extends StateNotifier<Counter>{
  CounterNotifier() : super(Counter());

  increment(){
    state=Counter(value: state.value+1);
  }
  @override
  set state(Counter value) {
    // TODO: implement state
    super.state = value;
  }
}