import 'package:flutter/material.dart';
import 'package:note_app/add_or_edit_page.dart';
import 'package:note_app/network_services/api_calls.dart';

ValueNotifier titleNotifier = ValueNotifier("Title");
ValueNotifier contentNotifier = ValueNotifier(
    "ff fsdf sihf fsfg ff d  dfg g gdf g df gdg d gdfgfdgdgdfgdg  fgdf gdg   g  gjgjd ddj dgd di g  iuf iuhdi dgh ddg duhgdg ghufigd ighdigd dgdhgiy7fdfi      yg7y   hgh hggggggggggggggggggggggggggggggggggggggggggg gdhugyhg  ig i  iu  uigy gggrrrrrrirueryh uiyt iu yiuey i ie iyiu tiiuy iytieuetyeiutyeeyi euyieuy");

class AllNotesPage extends StatelessWidget {
  const AllNotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DioCrud dioCrud = DioCrud();
    dioCrud.getAllNotes();
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          color: Colors.cyan,
          child: GridView.count(
            padding: const EdgeInsets.all(15),
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(
              10,
              (index) => TextArea(
                index: index,
              ),
            ),
          ),
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
  const TextArea({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => AddOrEditPage(
            isEdit: true,
            id: "$index",
            title: titleNotifier.value,
            content: contentNotifier.value,
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
                    titleNotifier.value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent[700],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        // delete button
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[800],
                      )),
                ],
              ),
            ),
            Text(
              contentNotifier.value,
              style: TextStyle(overflow: TextOverflow.ellipsis),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
