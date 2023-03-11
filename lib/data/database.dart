import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase 
{
  List TodoList = [];

  //reference our box
  final _myBox = Hive.box('mybox');

//if the user open the first time To Do App
  void CreateInitialData(){
    TodoList = [
      ['Dinner at 10:AM',false,],
      ['Going to Gym',false]
    ];
  }

//Load Data into the Database
  void loadData(){
    TodoList = _myBox.get('ToDoList');

  }

//Update Database
void UpdateData(){
 _myBox.put('ToDoList', TodoList);
}
}