import 'package:flutter/material.dart';
import 'package:flutter_todoapp/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller; 

  VoidCallback onSave; 
  VoidCallback onCancel; 

   DialogBox({
    super.key, 
    required this.controller, 
    required this.onSave, 
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      content: Container(
        height: 129,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controller ,
            decoration: InputDecoration(
              border: OutlineInputBorder(), 
              hintText: "Add a new task", 
            ),
          ), 

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            // save butotn 
              Button(text: "Save", onPressed: onSave), 

              const SizedBox(width: 8,),
            // cancel button 

            Button(text: "Cancel", onPressed: onCancel),
          ],)

        ]
        ),
      ),
    );
  }
}