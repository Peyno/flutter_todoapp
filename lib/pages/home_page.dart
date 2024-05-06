import 'package:flutter/material.dart';
import 'package:flutter_todoapp/util/dialog_box.dart';
import 'package:flutter_todoapp/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // controller
  final _controller = TextEditingController(); 

  //lsit of tasks
  List toDoList = [
    ["First", false], 
    ["Second", false], 

  ]; 


  // checkbox was tapped

  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1]; 
    });
  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]); 
      _controller.clear(); 
    });
    Navigator.of(context).pop(); 
  }

  //create new task
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller ,
        onSave: saveNewTask, 
        onCancel: () => Navigator.of(context).pop(),
      ); 
    },
    ); 
  }

  // delete Task

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        
        title: const Text("TO DO LIST",
        style: TextStyle(
          
          fontSize: 20, 
          
        ),
        ), 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask, 
        child: Icon(Icons.add),
     ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            tasName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: ((value) => checkBoxChanged(value, index)),
            deleteFunction: (context) => deleteTask(index) , 
            ); 
        },
      ),
    );
  }
}