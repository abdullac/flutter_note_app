import 'package:flutter/material.dart';

class AddOrEditPage extends StatelessWidget {
  const AddOrEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          TextField(maxLines: 8,
            decoration: InputDecoration(
              hintText: "Content:",
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}
