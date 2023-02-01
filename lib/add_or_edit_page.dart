import 'package:flutter/material.dart';

class AddOrEditPage extends StatelessWidget {
  const AddOrEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: const [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Title:",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  maxLines: 8,
                  decoration: InputDecoration(
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
              Navigator.of(context).pop();
              print("wwww");
            },
            label: const Text(
              "Save Note",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
