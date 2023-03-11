

import 'package:flutter/material.dart';
import 'package:todo_app_2/utils/mybuttons.dart';

class DialogBox extends StatefulWidget {

final controller;
VoidCallback onSave;
VoidCallback oncancel;



   DialogBox({ Key? key, required this.controller, required this.onSave , required this.oncancel}) : super(key: key);

  @override
  _DialogBoxState createState() => _DialogBoxState();
}


class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[100],
      content: Container(
        height: 120,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller:widget.controller,
              decoration:InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task', 
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Mybuttons(text: 'Save', onPressed: widget.onSave),
                SizedBox(width: 4),
                Mybuttons(text: 'Cancel', onPressed: widget.oncancel,),
              ],
            )
          ],
        )
      ),
    );
  }
}