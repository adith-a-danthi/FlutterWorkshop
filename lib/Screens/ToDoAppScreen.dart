import 'package:flutter/material.dart';
import 'package:flutter_app/Model/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoAppScreen extends StatefulWidget {
  @override
  _ToDoAppScreen createState() => _ToDoAppScreen();
}

class _ToDoAppScreen extends State<ToDoAppScreen> {
  final TextEditingController controller = new TextEditingController();

  List<ToDo> todoList = [];
  int count = 0;

  @override
  void initState() {
    super.initState();
    localStorageTest();
  }

  localStorageTest() async {
    var amIStored = await SharedPreferences.getInstance();

    if (amIStored == null)
      print("Empty Local Storage");
    else {
      print("There is something in Storage");
    }
  }

  void addTodoItem() async{
    
    var amIStored = await SharedPreferences.getInstance();
    amIStored.setBool("Test", true);


    ToDo item = ToDo();
    item.task = controller.text;
    item.isCompleted = false;
    item.id = count++;
    setState(() {
      todoList.add(item);
      controller.text = "";
    });
    Navigator.of(context).pop();
  }

  void deleteTodoItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(todoList);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("To-Do"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext newContext) {
                return AlertDialog(
                  title: Text("Add new Task"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: controller,
                        decoration:
                            InputDecoration(labelText: "Write Something Here."),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: addTodoItem,
                        child: Text("Add me"),
                      )
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Checkbox(
                value: todoList[index].isCompleted,
                onChanged: (val) {
                  // int indexOfToDoObject = todoList.indexOf(todoList[index]);
                  // ToDo item = todoList[index];
                  // item.isCompleted = !item.isCompleted;
                  setState(() {
                    todoList[index].isCompleted = !todoList[index].isCompleted;
                  });
                },
              ),
              title: Text(
                "${todoList[index].task}",
                style: TextStyle(
                    decoration: todoList[index].isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              trailing: IconButton(
                onPressed: () {
                  deleteTodoItem(index);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
