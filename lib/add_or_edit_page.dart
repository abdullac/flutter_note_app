import 'package:flutter/material.dart';
import 'package:note_app/all_notes_page.dart';
import 'package:note_app/model/data_model.dart';
import 'package:note_app/network_services/api_calls.dart';

TextEditingController titleEditingController = TextEditingController();
TextEditingController contentEditingController = TextEditingController();

class AddOrEditPage extends StatelessWidget {
  final bool isEdit;
  final String? index;
  final DataModel? dataModel;
  const AddOrEditPage({
    Key? key,
    required this.isEdit,
    this.index,
    this.dataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    titleEditingController.text = dataModel?.title ?? "";
    contentEditingController.text = dataModel?.content ?? "";
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
                  if (isEdit != true) {
                    print("button clicked for save");
                    buttonClick(isEdit, context);
                  } else {
                    print("button clicked for update");
                    buttonClick(isEdit, context, dataModel: dataModel);
                  }
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

buttonClick(isEdit, context, {String? index, DataModel? dataModel}) async {
  DioCrud dioCrud = DioCrud();
  if (isEdit == false) {
    final note = await dioCrud.createNote(DataModel(
      sId: DateTime.now().toString(),
      title: titleEditingController.text,
      content: contentEditingController.text,
    ));
    if (note == null) {
      print("unable to save");
    } else {
      listOfDataModelNotifier.value.clear();
      listOfDataModelNotifier.value = await DioCrud.instance.getAllNotes();
      listOfDataModelNotifier.notifyListeners();
      Navigator.of(context).pop();
    }
  } else {
    final note = dioCrud.updateNote(DataModel(
        sId: dataModel?.sId,
        title: titleEditingController.text,
        content: contentEditingController.text));
    if (note == null) {
      print("unable to update");
    } else {
      listOfDataModelNotifier.value.clear();
      listOfDataModelNotifier.value = await DioCrud.instance.getAllNotes();
      listOfDataModelNotifier.notifyListeners();
      Navigator.of(context).pop();
    }
  }
}
