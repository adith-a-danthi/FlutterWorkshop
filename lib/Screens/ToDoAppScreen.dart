import 'package:flutter/material.dart';

class ToDoAppScreen extends StatefulWidget{
  @override
  _ToDoAppScreen createState() => _ToDoAppScreen();
}

class _ToDoAppScreen extends State<ToDoAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("To-Do"),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
  
}