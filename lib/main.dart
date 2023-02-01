import 'package:flutter/material.dart';
import 'package:note_app/all_notes_page.dart';

// enum FloatButtonType {
//   addNote,
//   saveNote,
// }

// ValueNotifier<FloatButtonType> topButtonNotifier =
//     ValueNotifier(FloatButtonType.addNote);


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text("All Notes"),
        ),
        body: SafeArea(
          child: AllNotesPage(),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: Container(
        //   width: 110,
        //   child: FloatingActionButton(
        //     onPressed: () {
        //       // float Button (add notes / seve note)
        //       Navigator.of(context).push(MaterialPageRoute(
        //         builder: (ctx) {
        //           floatButtonNotifier.value = FloatButtonType.saveNote;
        //           return const AddOrEditPage();
        //         },
        //       ));
        //     },
        //     shape:
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        //     child: ValueListenableBuilder(
        //       valueListenable: floatButtonNotifier,
        //       builder: (BuildContext context, value, Widget? child) => Row(
        //         children: [
        //           Icon(floatButtonNotifier.value == FloatButtonType.addNote
        //               ? Icons.add
        //               : Icons.save_alt),
        //           Text(floatButtonNotifier.value == FloatButtonType.addNote
        //               ? "Add Note"
        //               : "Save Note"),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
