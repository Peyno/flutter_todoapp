import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text; 
  VoidCallback onPressed; 


   Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed, 
      child: Text(text), 
      color: const Color.fromARGB(255, 58, 58, 58), 
    
    );
  }
}