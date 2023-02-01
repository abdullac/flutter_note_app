import 'package:flutter/material.dart';
import 'package:note_app/add_or_edit_page.dart';
import 'package:note_app/model/data_model.dart';
import 'package:note_app/network_services/api_calls.dart';

final listOfDataModelNotifier = ValueNotifier([DataModel()]);

class AllNotesPage extends StatelessWidget {
  const AllNotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      listOfDataModelNotifier.value = await DioCrud.instance.getAllNotes();
    });
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          color: Colors.cyan,
          child: ValueListenableBuilder(
              valueListenable: listOfDataModelNotifier,
              builder: (BuildContext context, value, Widget? _) {
                final list = listOfDataModelNotifier.value;
                return list.isEmpty
                          ? Center(child: SizedBox(child: Text("Data Empty",style: TextStyle(color: Colors.red,fontSize: 20),)))
                          :  GridView.count(
                  padding: const EdgeInsets.all(15),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(
                    list.isEmpty ? 0 : list.length,
                    (index) {
                      DataModel dataModel = list[index];
                      return TextArea(
                              index: index,
                              dataModel: dataModel,
                            );
                    },
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              // button
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddOrEditPage(
                        isEdit: false,
                      )));
            },
            label: const Text(
              "Add Note",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class TextArea extends StatelessWidget {
  final int index;
  final DataModel dataModel;
  const TextArea({
    super.key,
    required this.index,
    required this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => AddOrEditPage(
            isEdit: true,
            index: "$index",
            dataModel: dataModel,
          ),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.red,
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: Colors.pink[300],
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dataModel.title ?? "null",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent[700],
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        // delete button
                        DioCrud.instance.deleteNote(dataModel.sId!);
                        listOfDataModelNotifier.value.clear();
                        listOfDataModelNotifier.value =
                            await DioCrud.instance.getAllNotes();
                        listOfDataModelNotifier.notifyListeners();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[800],
                      )),
                ],
              ),
            ),
            Text(
              dataModel.content ?? "null",
              style: TextStyle(overflow: TextOverflow.ellipsis),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
