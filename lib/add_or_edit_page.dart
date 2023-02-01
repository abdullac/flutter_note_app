import 'package:flutter/material.dart';
import 'package:note_app/all_notes_page.dart';
import 'package:note_app/model/data_model.dart';
import 'package:note_app/network_services/api_calls.dart';

TextEditingController titleEditingController = TextEditingController();
TextEditingController contentEditingController = TextEditingController();

class AddOrEditPage extends StatelessWidget {
  final bool isEdit;
  final String? id;
  final String? title;
  final String? content;
  const AddOrEditPage({
    Key? key,
    required this.isEdit,
    this.title,
    this.content,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    titleEditingController.text = title ?? "";
    contentEditingController.text = content ?? "";
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEdit == true ? "Edit Note" : "Add Note"),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  TextField(
                    controller: titleEditingController,
                    decoration: const InputDecoration(
                      hintText: "Title:",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: contentEditingController,
                    maxLines: 8,
                    decoration: const InputDecoration(
                      hintText: "Content:",
                      border: OutlineInputBorder(),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.save_alt,
                  color: Colors.white,
                ),
                onPressed: () {
                  // button
                  print(isEdit == true
                      ? "button clicked for update"
                      : "button clicked for save");
                  DioCrud dioCrud = DioCrud();
                  dioCrud.createNote(DataModel(
                    sId: DateTime.now().toString(),
                    title: titleEditingController.text,
                    content: contentEditingController.text,
                  ));
                  Navigator.of(context).pop();
                },
                label: Text(
                  isEdit != true ? "Save Note" : "Update Note",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
