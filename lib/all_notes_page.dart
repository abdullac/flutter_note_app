import 'package:flutter/material.dart';
import 'package:note_app/add_or_edit_page.dart';

class AllNotesPage extends StatelessWidget {
  const AllNotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              (index) => const TextArea(),
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
        
              print("wwww");
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
  const TextArea({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => AddOrEditPage(),
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: Colors.pink[300],
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Title",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent[700],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        //
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[800],
                      )),
                ],
              ),
            ),
            Text(
              "ff fsdf sihf fsfg ff d  dfg g gdf g df gdg d gdfgfdgdgdfgdg  fgdf gdg   g  gjgjd ddj dgd di g  iuf iuhdi dgh ddg duhgdg ghufigd ighdigd dgdhgiy7fdfi      yg7y   hgh hggggggggggggggggggggggggggggggggggggggggggg gdhugyhg  ig i  iu  uigy gggrrrrrrirueryh uiyt iu yiuey i ie iyiu tiiuy iytieuetyeiutyeeyi euyieuy",
              style: TextStyle(overflow: TextOverflow.ellipsis),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
