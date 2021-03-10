import 'package:demo_river_pod/counter.dart';
import 'package:demo_river_pod/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateNotifierProvider((ref) => CounterNotifier());
final personNotifier = StateNotifierProvider((ref) => PersonNotifier());
final indextNotifier =
    ChangeNotifierProvider<IntNotifier>((ref) => IntNotifier());
final mystream = StreamProvider<int>((ref) => Stream.value(10));

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final stream = watch(mystream);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: stream.when(
              data: (data) => Text(data.toString()),
              loading: () => CircularProgressIndicator(),
              error: (e,s)=>Text("${e} ${s}")),
        ),
      ),
    );
  }
}

// class MyApp extends ConsumerWidget {
//   final edtId = TextEditingController();
//   final edtName = TextEditingController();
//
//   @override
//   Widget build(BuildContext context, watch) {
//     final value = watch(counter.state);
//     final intdext = watch(indextNotifier);
//     final listPerson = watch(personNotifier.state);
//     return MaterialApp(
//       home: Scaffold(
//         floatingActionButton: Column(
//           children: [
//             FloatingActionButton(
//               child: Icon(Icons.add),
//               onPressed: () {
//                 context.read(counter).increment();
//               },
//             ),
//             FloatingActionButton(
//               child: Icon(Icons.add),
//               onPressed: () {
//                 context.read(indextNotifier).incrementIndext();
//               },
//             ),
//             FloatingActionButton(
//               child: Icon(Icons.person),
//               onPressed: () {
//                 context.read(personNotifier).addList(Person(id: edtId.text,name: edtName.text));
//               },
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           physics: NeverScrollableScrollPhysics(),
//           child: Column(
//             children: [
//               TextField(
//                 controller: edtId,
//               ),
//               TextField(
//                 controller: edtName,
//               ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: Text(listPerson[index].id),
//                     title: Text(listPerson[index].name),
//                   );
//                 },
//                 itemCount: listPerson.length,
//               ),
//               Text(value.value.toString()),
//               Text(intdext.index.toString()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
