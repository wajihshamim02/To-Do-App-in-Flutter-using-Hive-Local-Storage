import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/database.dart';
import '../utils/dialog_box.dart';
import '../utils/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // If this is the first time ever openning the app , then create default Data
     if(_myBox.get('ToDoList') == null){
      db.CreateInitialData();
     }
     else {
       db.loadData();
     }

    super.initState();
  }

  final _controller = TextEditingController();

  // List TodoList = [
  //   [
  //     'Dinner',
  //     false,
  //   ],
  //   ['Breakfast', true]
  // ];

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.TodoList[index][1] = !db.TodoList[index][1];
    });
    db.UpdateData();
  }

//Create new task
  void savenewtask() {
    setState(() {
      db.TodoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.pop(context);
  }

// Delete Task

void deletetask(int index){
  setState(() {
     db.TodoList.removeAt(index);
  });
  db.UpdateData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogBox(
                  controller: _controller,
                  onSave: () {
                    savenewtask();
                  },
                  oncancel: () {
                    Navigator.pop(context);
                  },
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.TodoList.length,
          itemBuilder: ((context, index) {
            return TodoTile(
              TaskName: db.TodoList[index][0],
              TaskCompleted: db.TodoList[index][1],
              onChanged: (value) {
                checkboxchanged(value, index);
                
              }, 
              ondelete: (BuildContext ) { 
                deletetask(index);
               },
            
            );
          })),
    );
  }
}
